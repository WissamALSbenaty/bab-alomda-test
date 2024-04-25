
abstract class ILogger {

  Future<void> initLogger();
  Future<void> logCritical({required final Exception exception,required final StackTrace stackTrace});
  void logEvent( final void Function() eventCallback);

}