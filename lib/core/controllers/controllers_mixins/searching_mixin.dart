


import 'package:mobx/mobx.dart';
import 'package:bab_alomda/core/controllers/base_controller.dart';

mixin SearchingMixin on BaseController{

  @observable
  String? searchString;

  void onChangeSearchString();
  @action
  void changeSearchString(final String? newSearchString){
    searchString=newSearchString;
    onChangeSearchString();
  }
}