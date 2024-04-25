
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:bab_alomda/core/controllers/app_controller.dart';
import 'package:bab_alomda/core/controllers/localization_controller.dart';
import 'package:bab_alomda/core/presentation/app_style.dart';
import 'package:bab_alomda/core/presentation/router/auto_router.dart';
import 'package:bab_alomda/core/utils/flavors.dart';
import 'package:bab_alomda/dependencies.dart';

class App extends StatefulWidget {

  final Flavor appFlavor;
  const App({required this.appFlavor, super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App>{


  @override
  Widget build(final BuildContext context) {
      return MultiProvider(providers: [
      Provider<AppController>.value(value: getIt<AppController>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter.config(),
        theme: AppStyle.theme,

        builder:(final context, final child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(viewPadding: EdgeInsets.zero,
                textScaler: TextScaler.linear(1)),
            child: child!),
        // home: const SplashPage(),

      ),
    );
  }

}
