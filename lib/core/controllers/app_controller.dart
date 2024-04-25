
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:bab_alomda/core/controllers/base_controller.dart';
import 'package:bab_alomda/core/presentation/router/auto_router.dart';
import 'package:bab_alomda/core/utils/flavors.dart';

part 'app_controller.g.dart';
@singleton
class AppController extends AppControllerBase with _$AppController{
  AppController(super.flavor,super.logger);

}

abstract class AppControllerBase extends BaseController with Store  {
  final Flavor flavor;
  AppControllerBase(this.flavor,super.logger){
    loadData();
  }


  @override
  @action
  Future<void> loadData()=>runStorePrimaryFunction(()async{
    await dotenv.load(fileName: '.env');
    mainContext.config = mainContext.config.clone(disableErrorBoundaries: flavor.showErrors);

    await logger.initLogger();
    await appRouter.replace(HomeRouteNavigation());

      },onCatchError: (final e)async{

        await appRouter.replace(AppErrorRoute());
  });



}