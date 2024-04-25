


import 'package:mobx/mobx.dart';
import 'package:bab_alomda/core/controllers/list_data_loader.dart';
import 'package:bab_alomda/data/models/pagination_data_model.dart';

part 'pagination_list_data_loader.g.dart';

abstract class PaginationListDataLoader<T> extends PaginationListDataLoaderBase<T> with _$PaginationListDataLoader {
  PaginationListDataLoader(super.logger);

}

abstract class PaginationListDataLoaderBase<T> extends ListDataLoader<T> with Store{

  PaginationListDataLoaderBase(super.logger);
  Future<PaginationDataModel<T>> paginationGetter (final int pageNumber);

  @override
  Future<List<T>> listGetter()async=>(await paginationGetter(0)).items;


  int pageNumber=0;

  @observable
  bool isLoadingMoreData=false;

  @observable
  bool canLoadMoreData=true;



  @override
  @action
  Future<void> loadData()=>runStorePrimaryFunction(()async{
    await onInit();
    canLoadMoreData=true;
    isLoadingMoreData=false;
    pageNumber=0;

    final PaginationDataModel<T> paginationData=await paginationGetter(++pageNumber);
    canLoadMoreData=paginationData.items.length>=10;
    data= paginationData.items.asObservable();
    if(data!.isEmpty && emptyError!=null ) {
      throw emptyError!;
    }

  });


  @action
  Future<void> loadNextPage()=>runStoreSecondaryFunction(Future(()async{
    if(isLoadingMoreData || !canLoadMoreData) {
      return ;
    }
        isLoadingMoreData=true;


    final PaginationDataModel<T> paginationData=await paginationGetter(++pageNumber);
    canLoadMoreData=paginationData.items.length>=10;
    final List<T> newData= paginationData.items;
    data?.addAll(newData);
    isLoadingMoreData=false;
  }),onCatchError: (final e){
    isLoadingMoreData=false;
  });


}