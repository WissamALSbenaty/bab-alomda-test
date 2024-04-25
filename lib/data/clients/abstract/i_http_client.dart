import 'package:bab_alomda/core/utils/enums.dart';
import 'package:bab_alomda/data/models/response_model.dart';
import 'package:bab_alomda/data/third_parties_modules/abstract/i_dio_module.dart';

abstract class IHttpClient{

  final IDioModule dioModule;
  IHttpClient(this.dioModule);
  String userToken = '';


  Future<ResponseModel> sendRequest({required final RequestMethod requestType,required final String url,required final Map<String,dynamic> parameters,
    required final bool needLocation, final bool isFormData=false});

  void setToken(final String token) => userToken = token;
}