


import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:bab_alomda/core/controllers/object_data_loader.dart';
import 'package:bab_alomda/data/errors/custom_error.dart';

part 'list_data_loader.g.dart';

abstract class ListDataLoader<T> extends ListDataLoaderBase<T> with _$ListDataLoader{

  ListDataLoader(super.logger);
}

abstract class ListDataLoaderBase<T> extends ObjectDataLoader<ObservableList<T>>  with Store  {

  ListDataLoaderBase(super.logger);
  final GlobalKey<AnimatedListState> animatedListKey = GlobalKey();
  Future<List<T>> listGetter();

  CustomError?  emptyError;
  @override
  Future<ObservableList<T>> dataGetter()async=>(await listGetter()).asObservable();


  @override
  @action
  Future<void> loadData()=>runStorePrimaryFunction(()async{
      await onInit();
        final List<T> result =await dataGetter();
      data= result.asObservable();
        if(data!.isEmpty&& emptyError!=null ) {
        throw emptyError!;
    }
  });


  @override
  void dispose() {
    animatedListKey.currentState?.dispose();
    super.dispose();
  }

}