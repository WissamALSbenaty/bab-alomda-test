import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bab_alomda/core/presentation/app_style.dart';
import 'package:bab_alomda/core/utils/extensions.dart';

class MainButton extends StatefulWidget {

  final String title;
  final double? width;
  final void Function() onPressed;
  final bool isLoading,isDisabled;
  final IconData? icon;


  const MainButton({required this.title,required this.isLoading, required this.onPressed, this.isDisabled=false,this.width, this.icon, super.key});

  factory MainButton.wide({required String title,required bool isLoading,required void Function() onPressed,bool isDisabled=false,})=>MainButton(title: title,
      isLoading: isLoading, onPressed: onPressed,width:282 ,);

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {

  bool isLongPressed=false;


  @override
  Widget build(final BuildContext context) {
    return FittedBox(
      child: Container(
        constraints: BoxConstraints(
          minWidth: (widget.width??100).w/*-(isLongPressed?8.r:0)*/,
          minHeight: 40.h/*-(isLongPressed?4.r:0)*/,
          maxHeight: 40.h/*-(isLongPressed?4.r:0)*/,
        ),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 50),
          margin: EdgeInsets.all(  isLongPressed?2.r:0),
          child:  Material(
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: AppStyle.borderRadius),
            child: InkWell(
              customBorder: RoundedRectangleBorder(borderRadius: AppStyle.borderRadius),
              onTap:!widget.isLoading?  (){
                FocusManager.instance.primaryFocus?.unfocus();
                widget.onPressed();
              }:null,
              onTapDown:(final _)=>setState(() => isLongPressed=true),
              onTapUp:(final _)=>setState(() => isLongPressed=false),
              onTapCancel: ()=>setState(() => isLongPressed=false),
              child: Ink(
                decoration:  BoxDecoration(
                    gradient: !widget.isDisabled ?AppStyle.gradient:null,
                    color: widget.isDisabled? AppStyle.black.shade300:null,
                    borderRadius: AppStyle.borderRadius
                ),
                child: Padding(
                  padding: EdgeInsets.all(4.r),
                  child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: widget.isLoading?const CircularProgressIndicator(color: AppStyle.white,):

                  Center(
                  child: Padding(
                  padding:  EdgeInsets.all(4.r),
                  child: Text(widget.title,
                    style:  AppStyle.textTheme.bodyMedium!.copyWith(color: AppStyle.white,fontWeight: FontWeight.bold),),
                )),

                  ),
                ),
              ),
              ),
          ),
              ),
      ),
    );
  }
}
