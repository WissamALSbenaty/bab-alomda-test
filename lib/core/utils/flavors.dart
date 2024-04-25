import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

abstract class Flavor{
  String get baseUrl;
  String get name;
  bool get showErrors;
  bool get isMultiDevicePreview;
}
@Environment('TestingFlavor')
@Singleton(as:Flavor,order:-1)
class TestingFlavor extends Flavor{
  @override
  String get baseUrl =>dotenv.get('developmentBaseUrl');
  @override
  String get name =>'TestingFlavor';
  @override
  bool get showErrors => true;
  @override
  bool get isMultiDevicePreview => false;
}


@Environment('DevelopingFlavor')
@Singleton(as:Flavor,order:-1)
class DevelopingFlavor extends Flavor{
  @override
  String get baseUrl =>dotenv.get('developmentBaseUrl');
  @override
  String get name =>'DevelopingFlavor';
  @override
  bool get showErrors => true;
  @override
  bool get isMultiDevicePreview => true;
}

@Environment('StagingFlavor')
@Singleton(as:Flavor,order:-1)
class StagingFlavor extends Flavor{
  @override
  String get baseUrl =>dotenv.get('stagingBaseUrl');
  @override
  String get name =>'StagingFlavor';
  @override
  bool get showErrors => false;
  @override
  bool get isMultiDevicePreview => false;
}

@Environment('ProductionFlavor')
@Singleton(as:Flavor,order:-1)
class ProductionFlavor extends Flavor{
  @override
  String get baseUrl =>dotenv.get('productionBaseUrl');

  @override
  String get name => 'ProductionFlavor';
  @override
  bool get showErrors =>false;
  @override
  bool get isMultiDevicePreview => false;


}
