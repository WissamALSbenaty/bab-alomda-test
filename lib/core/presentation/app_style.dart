
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bab_alomda/dependencies.dart';

class AppStyle {
  
  static final ThemeData theme=ThemeData(
    primaryColor:lightPrimaryColor,
    textTheme:textTheme,
    scaffoldBackgroundColor:white,
    indicatorColor: lightPrimaryColor,
    iconButtonTheme:IconButtonThemeData(
      style:ButtonStyle(
        padding:MaterialStateProperty.all(EdgeInsets.zero),
      )
    ),
    cardTheme:CardTheme(
      color:white,
      surfaceTintColor:Colors.transparent
    )
  );
  static final TextTheme textTheme = TextTheme(

    headlineMedium:TextStyle(
        fontSize:36.sp,
        height:1,
        color:black,
      fontWeight:FontWeight.bold,
        ),
    headlineSmall:TextStyle(
        fontSize:32.sp,
        height:1,
        color:black,
      fontWeight:FontWeight.bold,
        ),
    titleLarge:TextStyle(
        fontSize:28.sp,
        height:1,
        color:black,
        ),
    titleMedium:TextStyle(
        fontSize:24.sp,
        height:1,
        color:black,
        ),
    titleSmall:TextStyle(
        fontSize:20.sp,
        height:1,
        color:black,
        ),
    bodyLarge:TextStyle(
        fontSize:16.sp,
        height:1,
        color:black,
        ),

    bodyMedium:TextStyle(
        fontSize:14.sp,
        height:1,
        color:black,
        ),
    bodySmall:TextStyle(
        fontSize:12.sp,
        height:1,
        color:black,
        ),
    labelSmall:TextStyle(
        fontSize:10.sp,
        height:1,
        color:black,
        ),
  );

  static  List<BoxShadow> boxShadow = [BoxShadow(offset:const Offset(0, 2), color:AppStyle.black.shade200, blurRadius:1.r)];

  static const Color white=Color(0xFFFFFFFF);
  static const Color errorColor = Color(0xFFE30000);
  static const Color starsColor =Color(0xFFF5C107);
  static const Color lightPrimaryColor =Color(0xFFDF7E8E);
  static const Color darkPrimaryColor= Color(0xFFBC6470);
  static const Color confirmationColor= Color(0xFF03BF87);
  static const Color lightPink= Color(0xFFFFE5EF);
  static const Color lightGray= Color(0xFFF4F3F3);

  static const LinearGradient gradient=LinearGradient(colors:[lightPrimaryColor,Color(0xFFAF4F64)],);
  static const BorderRadius borderRadius=BorderRadius.all(Radius.circular(4));
  static const MaterialColor black=MaterialColor(0xFF1A0700,{
    100:Color(0xFFEFF5FA),
    200:Color(0xFFE5E5E5),
    300:Color(0xFFC9CDD5),
    400:Color(0xFF949BAB),
    500:Color(0xFF8E989E),
    600:Color(0xFF73858F),
    800:Color(0xFF1A0700),
    900:Color(0xFF000000),
  });
  
  



}
