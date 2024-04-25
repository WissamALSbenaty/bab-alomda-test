import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bab_alomda/core/presentation/app_style.dart';
import 'package:bab_alomda/core/presentation/assets.dart';

@RoutePage()
class SplashScreenPage extends StatelessWidget {
  SplashScreenPage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(Assets.splashScreen,fit: BoxFit.cover,),
          Column(
            children: [
              SizedBox(height: 600.h,),
              CircularProgressIndicator(color: AppStyle.white,),
            ],
          )
        ],
      ),
    );
  }
}

