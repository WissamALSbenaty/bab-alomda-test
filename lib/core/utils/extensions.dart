import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:bab_alomda/core/presentation/app_style.dart';
import 'package:bab_alomda/core/presentation/router/auto_router.dart';
import 'package:bab_alomda/core/utils/enums.dart';
import 'package:bab_alomda/dependencies.dart';
extension DateTimeUtils on DateTime{
  String get dayFormat=> '$day/$month/$year';

  Duration get subtractFromNow=>difference(DateTime.now());

  String get timeFormat=> DateFormat('h:mm a').format(this);

}

extension AppRouteUtils on AppRouter{
  BuildContext get currentContext=>appRouter.navigatorKey.currentContext!;

}


extension StringUtils on String{
  String get toPascalCase{
    final List<String> allLetters=split('');
    String ret='';
    for(int i=0;i<allLetters.length;i++){
      if(i==0) {
        ret+=allLetters[0].toUpperCase();
      } else if(allLetters[i][0]==allLetters[i][0].toUpperCase()) {
        ret+=' ${allLetters[i][0]}';
      } else {
        ret+=allLetters[i][0];
      }
    }
    return ret;
  }

  String get capitalized{
    final String result= toPascalCase.toLowerCase();
    final List<String> letters=result.split('');
    letters[0]=letters[0].toUpperCase();
    return letters.fold('',(final pre,final current)=>"$pre$current");
  }

}
