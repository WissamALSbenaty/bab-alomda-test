
import 'package:bab_alomda/core/controllers/base_controller.dart';
import 'package:bab_alomda/core/presentation/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

@singleton
class LocalizationController extends  BaseController{

  LocalizationController(super.logger);


  Widget getHorizontalArrowIcon({required final double size,required final void Function()? onTap,
    final bool isLeftInEnglish=true,final Color? color}){

    return InkWell(
      onTap: onTap,
      child:  Center(child:  Icon(
          isLeftInEnglish ? Icons.arrow_back_ios_new :Icons.arrow_forward_ios,
        size: size.r,color: color??AppStyle.black.shade900,
      )),
    );
  }


}