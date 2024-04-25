// ignore_for_file: avoid_print

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:bab_alomda/core/utils/flavors.dart';
import 'package:bab_alomda/data/repositories/abstract/i_logger.dart';

@Singleton(as: ILogger)
class Logger extends ILogger{
  final Flavor appFlavor;

  Logger(this.appFlavor);

  @override
  Future<void> initLogger()async{
    /*if(!appFlavor.showErrors){
      FlutterError.onError = (final details){

        FirebaseCrashlytics.instance.recordFlutterFatalError(details);
      };

      PlatformDispatcher.instance.onError = (final error, final stackTrace) {
          FirebaseCrashlytics.instance.recordError(error, stackTrace);
        return true;
      };
    }*/
  }

  @override
  Future<void> logCritical({required final Exception exception,required final StackTrace stackTrace})async{
       /*print('Wiso Error $exception');
       if(!appFlavor.showErrors) {
         await FirebaseCrashlytics.instance.recordError(exception,stackTrace,);
       }
*/
  }
  @override
  void logEvent(final void Function() eventCallback){
  /*  if(!appFlavor.showErrors) {
      print('Wiso logging event');
      eventCallback();
    }*/
  }

}