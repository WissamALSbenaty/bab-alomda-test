import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bab_alomda/core/controllers/localization_controller.dart';
import 'package:bab_alomda/core/utils/enums.dart';
import 'package:bab_alomda/core/utils/flavors.dart';
import 'package:bab_alomda/data/third_parties_modules/abstract/i_dio_module.dart';
import 'package:bab_alomda/dependencies.dart';

@Environment('TestingFlavor')
@named
@Singleton(as:IDioModule)
class MockedDioModule extends Mock implements IDioModule{}


@Singleton(as:IDioModule)
class DioModule extends IDioModule{
  final Dio _dio=Dio();
  final Flavor appFlavor;


  DioModule(this.appFlavor){
    _dio.interceptors.addAll([
      LogInterceptor(requestBody: true, request: true, responseBody: true, requestHeader: true, responseHeader: false,)
    ]);
  }

  Map<String, String>  _headers(final String userToken) => {
    'accept': 'application/json',
    'X-Platform':'mobileApp',
    if ( userToken.length > 7) 'Authorization': 'Bearer $userToken',
  };


  @override
  Future<Response> request(final String url,{required final String userToken,required final RequestMethod requestType,required final Map<String,dynamic>parameters,
    required final bool isFormData})=>_dio.request('${appFlavor.baseUrl}/$url' ,
    options: Options(method: requestType.name.toUpperCase(),headers: _headers(userToken)),
    queryParameters:(requestType==RequestMethod.get?  parameters: {}),
    onReceiveProgress:(final _,final __){},
    data:requestType!=RequestMethod.get? (isFormData? FormData.fromMap(parameters) : parameters) :null,
  );
}