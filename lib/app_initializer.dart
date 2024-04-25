
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bab_alomda/core/utils/flavors.dart';
import 'package:bab_alomda/dependencies.dart';
import 'package:bab_alomda/features/app/presentation/app.dart';

Future<void> customAppRunner(final Flavor flavor)async{
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies(flavor.name);

  runApp(
      ScreenUtilInit(
            designSize: const Size(375, 812),
            splitScreenMode: true,
            minTextAdapt: true,
            child: App(appFlavor: flavor,)

          ));
}