
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSizedBox extends StatelessWidget {

  final double? height,width;


  const CustomSizedBox({super.key, this.height, this.width});

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      height: height==null?null: height!.h,
      width: width==null?null: width!.w,
    );
  }
}
