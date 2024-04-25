import 'package:flutter/material.dart';
import 'package:bab_alomda/core/controllers/object_data_loader.dart';
import 'package:bab_alomda/core/presentation/widgets/base_data_loader.dart';


class ObjectDataLoaderWidget<T> extends StatelessWidget {
  final ObjectDataLoader<T> dataLoader;
  final Widget Function(T) childBuilder;
  final Widget? loadingShimmer;
  final Duration? animatingDuration;

  const ObjectDataLoaderWidget({required this.dataLoader,required this.childBuilder, this.animatingDuration, super.key, this.loadingShimmer,});



  @override
  Widget build(final BuildContext context) {
      return BaseDataLoader<T>(
          dataLoader: dataLoader,
          childBuilder: childBuilder,
          loadingWidget: loadingShimmer,
          animatingDuration: animatingDuration,
          dataGetter: ()=>dataLoader.data);
  }


}
