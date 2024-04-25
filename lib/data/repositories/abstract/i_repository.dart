


import 'package:bab_alomda/core/utils/enums.dart';
import 'package:bab_alomda/data/clients/abstract/i_http_client.dart';
import 'package:bab_alomda/data/models/pagination_data_model.dart';
import 'package:bab_alomda/data/models/pagination_response_model.dart';
import 'package:bab_alomda/data/models/response_model.dart';
import 'package:bab_alomda/data/repositories/abstract/i_logger.dart';

bool emptyMapper(final Map<String,dynamic> data) =>true;

abstract class IRepository {
  final IHttpClient httpClient;
  final ILogger logger;
  IRepository(this.httpClient,this.logger);


  Future<ResponseModel> _get({required final String url, required final Map<String, dynamic> parameters,required final bool needLocation})  =>  httpClient.sendRequest(
      requestType:  RequestMethod.get,url:  url,parameters:  parameters,needLocation: needLocation);
  Future<T> getObject<T>({required final String url,required final T Function(Map<String,dynamic>) mapper,required final bool needLocation, final Map<String, dynamic>? parameters}) async {
    final Map<String,dynamic> data=(await _get(url:url,parameters: parameters??{},needLocation: needLocation)).data;
    return mapper(data);
  }
  Future<List<T>> getList<T>({required final String url,  required final T Function(Map<String,dynamic>) mapper, required final bool needLocation, final Map<String, dynamic>? parameters}) async {
    final ResponseModel response = await _get(url: url, parameters:parameters??{},needLocation: needLocation);
    final List<dynamic> data=response.data;
    return data.map((final e)=>mapper(e)).toList();
  }
  Future<PaginationDataModel<T>> getPagination<T>({required final String url,required final int page ,
    required final Map<String, dynamic> parameters,required final bool needLocation,required final T Function(Map<String,dynamic>) mapper}) async {
    final PaginationResponseModel response= await httpClient.sendRequest(requestType:  RequestMethod.get,url:  url,parameters:  parameters..addAll({'page':page}),needLocation: needLocation) as PaginationResponseModel;
    return  PaginationDataModel.fromPaginationResponse(response,mapper);
  }
  Future<T> post<T>({required final String url, required final Map<String, dynamic> parameters,required final bool needLocation,
     required final T Function(Map<String,dynamic>) mapper,final bool isFormData=false}) async {
  final ResponseModel response =  await httpClient.sendRequest(requestType:  RequestMethod.post,url:  url,parameters:   parameters,isFormData: isFormData,needLocation: needLocation);
  return mapper(response.data);
  }
  Future<T> patch<T>({required final String url, required final Map<String, dynamic> parameters,required final bool needLocation,required final T Function(Map<String,dynamic>) mapper }) async {
  final ResponseModel response =  await httpClient.sendRequest(requestType:  RequestMethod.patch,url:  url,parameters:   parameters,isFormData: false,needLocation: needLocation);
  return mapper(response.data);
  }
  Future<T> put<T>({required final String url, required final Map<String, dynamic> parameters,required final bool needLocation,required final T Function(Map<String,dynamic>) mapper }) async {
  final ResponseModel response =  await httpClient.sendRequest(requestType:  RequestMethod.put,url:  url,parameters:   parameters,isFormData: false,needLocation: needLocation);
  return mapper(response.data);
  }
  Future<void> delete({required final String url,required final bool needLocation, final Map<String,dynamic>? parameters})  =>  httpClient.sendRequest(
      requestType:  RequestMethod.delete,url:  url,parameters: parameters??{},needLocation: needLocation);

}