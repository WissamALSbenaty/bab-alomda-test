import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bab_alomda/core/controllers/list_data_loader.dart';
import 'package:bab_alomda/core/presentation/app_style.dart';
import 'package:bab_alomda/core/presentation/widgets/custom_sized_box.dart';
import 'package:bab_alomda/core/presentation/widgets/object_data_loader_widget.dart';

class CustomListDataLoaderWidget<T> extends StatelessWidget {
  final ListDataLoader<T> dataLoader;
  final Widget Function(T)? dataToWidgetMapper;
  final Widget Function(List<T>)? listToWidgetMapper;
  final double spacing;


   const CustomListDataLoaderWidget({ required this.dataLoader,this.spacing=8,  this.dataToWidgetMapper, super.key, this.listToWidgetMapper,}):
      assert((dataToWidgetMapper==null && listToWidgetMapper!=null)||(dataToWidgetMapper!=null && listToWidgetMapper==null));

  @override
  Widget build(final BuildContext context) {
      return ObjectDataLoaderWidget(
          key: ValueKey(dataLoader.data?.length),
          dataLoader: dataLoader,
          /*loadingShimmer:const CustomListLoadingShimmer() ,*/
          childBuilder: (final data)=>
              listToWidgetMapper!=null?listToWidgetMapper!(data):
              RefreshIndicator(
                  color: AppStyle.lightPrimaryColor,
                  onRefresh: dataLoader.loadData,
                  child :SingleChildScrollView(
                 padding:  EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
              children: [
                CustomSizedBox(height: 8,),
                  for(T singleData in dataLoader.data!)
                    ...[
                      dataToWidgetMapper!(singleData),
                CustomSizedBox(height: spacing,),
                    ],
                      ])

                    )));
  }
}
