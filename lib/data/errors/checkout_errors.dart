import 'package:bab_alomda/data/errors/custom_error.dart';

class PaymentFailedError extends CustomError{
  PaymentFailedError():super(errorMessage:'Failed to pay , please try again',errorImage:null);

}