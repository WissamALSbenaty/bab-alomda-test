import 'package:auto_route/auto_route.dart';
import 'package:bab_alomda/core/presentation/arguments/web_view_page_arguments.dart';
import 'package:bab_alomda/core/presentation/pages/custom_web_view_page.dart';
import 'package:flutter/material.dart';
import 'package:bab_alomda/core/utils/enums.dart';
import 'package:bab_alomda/features/app/presentation/app_error_page.dart';
import 'package:bab_alomda/features/app/presentation/splash_screen_page.dart';
import 'package:bab_alomda/features/home/presentation/pages/home_page_navigation.dart';
part 'auto_router.gr.dart';

final AppRouter appRouter = AppRouter();
@AutoRouterConfig()
class AppRouter extends _$AppRouter {


  /*@override
  RouteType get defaultRouteType => RouteType.custom(transitionsBuilder: TransitionsBuilders.slideBottom,);*/
  @override
  List<AutoRoute> get routes =>  [
    AutoRoute(page: SplashRouteRoute.page,initial: true),
    AutoRoute(page: HomeRouteNavigation.page),
    AutoRoute(page: CustomWebViewRoute.page),
    AutoRoute(page: AppErrorRoute.page,),
  ];
}

