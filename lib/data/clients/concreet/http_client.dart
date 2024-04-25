import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:bab_alomda/core/utils/enums.dart';
import 'package:bab_alomda/data/clients/abstract/i_http_client.dart';
import 'package:bab_alomda/data/errors/api_error.dart';
import 'package:bab_alomda/data/errors/core_errors.dart';
import 'package:bab_alomda/data/models/pagination_response_model.dart';
import 'package:bab_alomda/data/models/response_model.dart';
import 'package:mocktail/mocktail.dart';


@Environment('TestingFlavor')
@named
@Singleton(as:IHttpClient)
class MockedHttpClient extends Mock implements IHttpClient {}



@Singleton(as:IHttpClient)
class HttpClient extends IHttpClient {


  HttpClient(super.dioModule);


  @override
  Future<ResponseModel> sendRequest({required final RequestMethod requestType,required final String url,
    required final Map<String,dynamic> parameters,required final bool needLocation, final bool isFormData=false})async{
    try {

      final Response response = await dioModule.request(url,parameters: parameters,isFormData:isFormData,requestType: requestType,
        userToken: userToken
      );

      return mapResponseToModel(response);
    }on SocketException{
      throw InternetConnectionError();
    }
    on DioException catch (e) {
      if( e.type==DioExceptionType.connectionTimeout||e.type==DioExceptionType.unknown) {
        print('Wiso e.type==DioExceptionType.connectionTimeout');
        throw InternetConnectionError();
      }
      if(e.response==null) {
        print('Wiso e.response==null');
        throw ServerError();
      }

      if((e.response?.statusCode?? 0)>=500 || e.response!.data is String){
        print('Wiso e.response!.data is String');
        throw ServerError();
      }
        final Map<String, dynamic> data = e.response!.data;
        throw  ApiError.fromJson(data).customError;
    }
    on Exception catch (e){
      print('Wiso error $e');
      throw ServerError();
    }
  }

  ResponseModel mapResponseToModel(final Response response) {
    final Map<String, dynamic>? data = response.data;
    try{
      return PaginationResponseModel.fromJson(json: data?['data']??{});
    }
    catch(_){
      return ResponseModel( data:data?['data']??{});
    }
  }

}
