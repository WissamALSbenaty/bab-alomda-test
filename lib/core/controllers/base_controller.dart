import 'dart:async';

import 'package:bab_alomda/core/presentation/snakebars/bottom_snack_bar.dart';
import 'package:mobx/mobx.dart';
import 'package:bab_alomda/core/presentation/router/auto_router.dart';
import 'package:bab_alomda/core/utils/enums.dart';
import 'package:bab_alomda/data/errors/core_errors.dart';
import 'package:bab_alomda/data/errors/custom_error.dart';
import 'package:bab_alomda/data/repositories/abstract/i_logger.dart';

part 'base_controller.g.dart';

class BaseController extends BaseControllerBase with _$BaseController{
  BaseController(super.logger);
}

abstract class BaseControllerBase with Store {

  final ILogger logger;
  bool get isLazyController=>false;

  BaseControllerBase(this.logger);

  @observable
  CustomError? error;

  @observable
  bool isLoading=false;

  @computed
  bool get hasData=> error==null && !isLoading ;


  @action
  Future<void> onInit()async{}

  Future<void> loadData()async{}

  (String,void Function())? get errorButton{
    if (error is ServerError || error is InternetConnectionError)
      return ('Try again',loadData);
    return null;
  }


  @action
  void dispose(){}

  @action
  Future<bool> runStorePrimaryFunction(final Future<void> Function() function, {final void Function(Object)? onCatchError })async{
    try{
      if(isLoading) {
        return false;
      }
      isLoading=true;
      error=null;
      await function();
      return true;
    }
    on CustomError catch(e,stackTrace){
      if(onCatchError!=null) {
        onCatchError(e);
      }
      if(e is ServerError) {
        await logger.logCritical(exception:  e,stackTrace: stackTrace);
      }
      error=e;
      return false;
    }
    on Exception catch(e,stackTrace){

      if(onCatchError!=null) {
        onCatchError(e);
      }
      error=ServerError();

      await logger.logCritical(exception:  e,stackTrace: stackTrace);
      return false;
    }
    finally{
      isLoading=false;
    }
  }

  @action
  Future<bool> runStoreSecondaryFunction(final Future function, {final void Function(Object)? onCatchError })async{
    try{
      await function;
      return true;
    }
    on CustomError catch (e,stackTrace){
      if(onCatchError!=null) {
        onCatchError(e);
      }
      showSnackBar(e.errorMessage,ToastType.error);
      if(e is ServerError) {
        await logger.logCritical(exception:  e,stackTrace: stackTrace);
      }
      return false;
    }
    on Exception catch(e,stackTrace){
      if(onCatchError!=null) {
        onCatchError(e);
      }
      await logger.logCritical(exception:  e,stackTrace: stackTrace);
      return false;
    }
  }



}