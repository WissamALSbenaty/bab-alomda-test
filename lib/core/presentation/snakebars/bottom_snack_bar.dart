
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bab_alomda/core/presentation/app_style.dart';
import 'package:bab_alomda/core/utils/enums.dart';
import 'package:bab_alomda/core/utils/extensions.dart';

final GlobalKey<ScaffoldMessengerState> snackbarKey = GlobalKey<ScaffoldMessengerState>();


void showSnackBar(final String message,final ToastType type) {
  Color backgroundColor;
  switch (type) {
  case ToastType.success:
  backgroundColor = AppStyle.darkPrimaryColor;
  break;
  case ToastType.error:
  backgroundColor = AppStyle.errorColor;
  break;
  default:
  backgroundColor = AppStyle.black;
  }

  snackbarKey.currentState?.clearSnackBars();


  snackbarKey.currentState?.showSnackBar(SnackBar(

    backgroundColor: backgroundColor,
    duration: const Duration(seconds: 1),
    behavior: SnackBarBehavior.floating,

    content: Text(message,style: AppStyle.textTheme.bodyMedium!.copyWith(color: Colors.white,
        fontWeight: FontWeight.bold),),
  ));


}

