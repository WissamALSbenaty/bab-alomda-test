// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'auto_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AppErrorRoute.name: (routeData) {
      final args = routeData.argsAs<AppErrorRouteArgs>(
          orElse: () => const AppErrorRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AppErrorPage(key: args.key),
      );
    },
    CustomWebViewRoute.name: (routeData) {
      final args = routeData.argsAs<CustomWebViewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CustomWebViewPage(
          args: args.args,
          key: args.key,
        ),
      );
    },
    HomeRouteNavigation.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePageNavigation(),
      );
    },
    SplashRouteRoute.name: (routeData) {
      final args = routeData.argsAs<SplashRouteRouteArgs>(
          orElse: () => const SplashRouteRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SplashScreenPage(key: args.key),
      );
    },
  };
}

/// generated route for
/// [AppErrorPage]
class AppErrorRoute extends PageRouteInfo<AppErrorRouteArgs> {
  AppErrorRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AppErrorRoute.name,
          args: AppErrorRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AppErrorRoute';

  static const PageInfo<AppErrorRouteArgs> page =
      PageInfo<AppErrorRouteArgs>(name);
}

class AppErrorRouteArgs {
  const AppErrorRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'AppErrorRouteArgs{key: $key}';
  }
}

/// generated route for
/// [CustomWebViewPage]
class CustomWebViewRoute extends PageRouteInfo<CustomWebViewRouteArgs> {
  CustomWebViewRoute({
    required WebViewPageArguments args,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CustomWebViewRoute.name,
          args: CustomWebViewRouteArgs(
            args: args,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CustomWebViewRoute';

  static const PageInfo<CustomWebViewRouteArgs> page =
      PageInfo<CustomWebViewRouteArgs>(name);
}

class CustomWebViewRouteArgs {
  const CustomWebViewRouteArgs({
    required this.args,
    this.key,
  });

  final WebViewPageArguments args;

  final Key? key;

  @override
  String toString() {
    return 'CustomWebViewRouteArgs{args: $args, key: $key}';
  }
}

/// generated route for
/// [HomePageNavigation]
class HomeRouteNavigation extends PageRouteInfo<void> {
  const HomeRouteNavigation({List<PageRouteInfo>? children})
      : super(
          HomeRouteNavigation.name,
          initialChildren: children,
        );

  static const String name = 'HomeRouteNavigation';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreenPage]
class SplashRouteRoute extends PageRouteInfo<SplashRouteRouteArgs> {
  SplashRouteRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SplashRouteRoute.name,
          args: SplashRouteRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SplashRouteRoute';

  static const PageInfo<SplashRouteRouteArgs> page =
      PageInfo<SplashRouteRouteArgs>(name);
}

class SplashRouteRouteArgs {
  const SplashRouteRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SplashRouteRouteArgs{key: $key}';
  }
}
