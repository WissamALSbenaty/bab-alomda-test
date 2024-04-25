import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:bab_alomda/core/controllers/app_controller.dart';
import 'package:bab_alomda/core/presentation/widgets/custom_empty_view.dart';
import 'package:bab_alomda/core/utils/mixins.dart';

@RoutePage()
class AppErrorPage extends StatelessWidget with WidgetControllerCreatorMixin<AppController>  {


   AppErrorPage({ final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: CustomEmptyView(controller: createdController,)
    );
  }
}
