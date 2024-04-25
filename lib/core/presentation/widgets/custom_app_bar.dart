


import 'package:flutter/material.dart';
import 'package:bab_alomda/core/controllers/localization_controller.dart';
import 'package:bab_alomda/core/presentation/app_style.dart';
import 'package:bab_alomda/core/presentation/router/auto_router.dart';
import 'package:bab_alomda/core/presentation/widgets/custom_sized_box.dart';
import 'package:bab_alomda/core/utils/extensions.dart';
import 'package:bab_alomda/dependencies.dart';

class CustomAppBar extends AppBar{
  final String barTitle;
  final BuildContext context;
  final List<Widget> barActions;
  final bool isColorfulBar;
  CustomAppBar({required this.barTitle, required this.context,required this.isColorfulBar, super.key,this.barActions=const []}):super(elevation: 0,
      titleSpacing: appRouter.canPop()?0:null,scrolledUnderElevation:0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient:isColorfulBar? AppStyle.gradient:null,
          color: !isColorfulBar? AppStyle.white:null,
        ),
      ),

      leading:appRouter.canPop()? getIt<LocalizationController>().getHorizontalArrowIcon(
        size:24, onTap:appRouter.maybePop,color:isColorfulBar? AppStyle.white:AppStyle.black.shade900
      ):null,

      title: Row(
        children: [
          Expanded(
            child: Text(
              barTitle,style: AppStyle.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600,color:isColorfulBar? AppStyle.white:AppStyle.black.shade900),
              maxLines: 1,overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      actions: [
        for(int i=0;i<barActions.length;i++)
          ...[
            barActions[i],
            const CustomSizedBox(width: 16,)
          ]
      ]
  );
}