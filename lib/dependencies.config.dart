// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/controllers/app_controller.dart' as _i11;
import 'core/controllers/localization_controller.dart' as _i10;
import 'core/utils/flavors.dart' as _i3;
import 'data/clients/abstract/i_http_client.dart' as _i6;
import 'data/clients/concreet/http_client.dart' as _i7;
import 'data/repositories/abstract/i_logger.dart' as _i8;
import 'data/repositories/concreet/logger.dart' as _i9;
import 'data/third_parties_modules/abstract/i_dio_module.dart' as _i4;
import 'data/third_parties_modules/concrete/dio_module.dart' as _i5;

const String _DevelopingFlavor = 'DevelopingFlavor';
const String _TestingFlavor = 'TestingFlavor';
const String _ProductionFlavor = 'ProductionFlavor';
const String _StagingFlavor = 'StagingFlavor';

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.singleton<_i3.Flavor>(
    () => _i3.DevelopingFlavor(),
    registerFor: {_DevelopingFlavor},
  );
  gh.singleton<_i3.Flavor>(
    () => _i3.TestingFlavor(),
    registerFor: {_TestingFlavor},
  );
  gh.singleton<_i3.Flavor>(
    () => _i3.ProductionFlavor(),
    registerFor: {_ProductionFlavor},
  );
  gh.singleton<_i3.Flavor>(
    () => _i3.StagingFlavor(),
    registerFor: {_StagingFlavor},
  );
  gh.singleton<_i4.IDioModule>(
    () => _i5.MockedDioModule(),
    instanceName: 'MockedDioModule',
    registerFor: {_TestingFlavor},
  );
  gh.singleton<_i4.IDioModule>(() => _i5.DioModule(gh<_i3.Flavor>()));
  gh.singleton<_i6.IHttpClient>(() => _i7.HttpClient(gh<_i4.IDioModule>()));
  gh.singleton<_i6.IHttpClient>(
    () => _i7.MockedHttpClient(),
    instanceName: 'MockedHttpClient',
    registerFor: {_TestingFlavor},
  );
  gh.singleton<_i8.ILogger>(() => _i9.Logger(gh<_i3.Flavor>()));
  gh.singleton<_i10.LocalizationController>(
      () => _i10.LocalizationController(gh<_i8.ILogger>()));
  gh.singleton<_i11.AppController>(() => _i11.AppController(
        gh<_i3.Flavor>(),
        gh<_i8.ILogger>(),
      ));
  return getIt;
}
