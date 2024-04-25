

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bab_alomda/core/controllers/base_controller.dart';
import 'package:bab_alomda/dependencies.dart';


mixin StateControllerCreatorMixin<T extends BaseController,F extends StatefulWidget> on State<F>{
  T createdController = getIt<T>();

  @override
  void dispose() {
    createdController.dispose();
    super.dispose();
  }
}

mixin WidgetControllerCreatorMixin<T extends BaseController> on Widget{
  final T createdController = getIt<T>();

}


mixin StateControllerProviderMixin<T extends BaseController,F extends StatefulWidget> on State<F>{
  late T providedController;
  bool isFirstDependency=true;

  void onChangeDependencies(){}
  @override
  void didChangeDependencies(){
    if(isFirstDependency){
      isFirstDependency=false;
      providedController=Provider.of<T>(context);
      onChangeDependencies();
    }

    super.didChangeDependencies();
  }
}


