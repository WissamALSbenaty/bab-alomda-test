


import 'package:dio/dio.dart';
import 'package:bab_alomda/core/utils/enums.dart';

abstract class IDioModule{
  Future<Response> request(final String url,{required final String userToken,required final RequestMethod requestType,
    required final Map<String,dynamic>parameters, required final bool isFormData});
}