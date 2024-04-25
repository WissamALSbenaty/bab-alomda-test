import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bab_alomda/core/controllers/base_controller.dart';
import 'package:bab_alomda/core/presentation/app_style.dart';
import 'package:bab_alomda/core/presentation/widgets/custom_sized_box.dart';
import 'package:bab_alomda/core/presentation/widgets/main_button.dart';
import 'package:bab_alomda/core/utils/extensions.dart';

class CustomEmptyView extends StatelessWidget {

  final BaseController controller;
  const CustomEmptyView({required this.controller, super.key});


  @override
  Widget build(final BuildContext context) {
    final (String,void Function() )? helperButton=controller.errorButton;
    return Stack(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [


              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(controller.error!.errorMessage,
                    textAlign: TextAlign.center,
                    style: AppStyle.textTheme.titleSmall!.copyWith(color: AppStyle.black.shade600)
                ),
              ),

              const CustomSizedBox(height: 16,),

              if(helperButton!=null)
                Center(
                  child: MainButton.wide(title: helperButton.$1,
                      isLoading: controller.isLoading,
                      onPressed: helperButton.$2),
                )

              //const Spacer(),
            ],
          ),
        ),
        IgnorePointer(

          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [

                Container(
                  height: 512.h,
                )

                //const Spacer(),
              ],
            ),
          ),
        )
      ],
    );

  }

}
