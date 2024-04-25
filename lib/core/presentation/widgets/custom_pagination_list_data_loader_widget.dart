import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bab_alomda/core/controllers/pagination_list_data_loader.dart';
import 'package:bab_alomda/core/presentation/app_style.dart';
import 'package:bab_alomda/core/presentation/widgets/object_data_loader_widget.dart';
import 'package:bab_alomda/core/presentation/widgets/three_dots_loading_indicator.dart';

class CustomPaginationListDataLoaderWidget<T > extends StatefulWidget {
  final PaginationListDataLoader<T> dataLoader;
  final EdgeInsets? padding;
  final Widget Function(List<T>) dataToWidgetMapper;
  final ScrollController? scrollController;

  const CustomPaginationListDataLoaderWidget({required this.dataLoader,required this.dataToWidgetMapper, this.padding, super.key, this.scrollController});

  @override
  State<CustomPaginationListDataLoaderWidget<T>> createState() => _CustomPaginationListDataLoaderWidgetState<T>();
}

class _CustomPaginationListDataLoaderWidgetState<T > extends State<CustomPaginationListDataLoaderWidget<T>> {

  late ScrollController scrollController;

  @override
  void initState() {

    scrollController=(widget.scrollController?? ScrollController())..addListener(() async{

      if ( widget.dataLoader.canLoadMoreData && !widget.dataLoader.isLoadingMoreData &&
          scrollController.position.pixels == scrollController.position.maxScrollExtent) {

         await widget.dataLoader.loadNextPage();
      }
    });
    super.initState();
  }


  @override
  Widget build(final BuildContext context) {
    return RefreshIndicator(
      color: AppStyle.lightPrimaryColor,
      onRefresh: widget.dataLoader.loadData,
      child :  AnimatedSwitcher(
            duration:const Duration(milliseconds: 300),
            transitionBuilder: (final child, final animation) => ScaleTransition(
              scale:animation,
              child: child,
            ),
        child: ObjectDataLoaderWidget(
          dataLoader: widget.dataLoader,
            childBuilder: (final data) {

              return  Column(

                    children: [

                      Expanded(
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding:widget.padding??  EdgeInsets.symmetric( vertical:  16.h,horizontal: 8.w),
                          controller: scrollController,
                          child: widget.dataToWidgetMapper(data),
                      )),
                      if(widget.dataLoader.isLoadingMoreData)
                        const ThreeDotsLoadingIndicator(),

                    ],
                  );
            }),
            ));
  }

  @override
  void dispose() {
    if(widget.scrollController==null) {
      scrollController.dispose();
    }
    super.dispose();
  }

}
