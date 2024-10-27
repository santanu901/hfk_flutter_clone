import 'package:get/get.dart';

class VerifyOtpController extends GetxController {
  RxInt mResendTimerCount = 5.obs;

  void decrementResendTimerCount() {
    mResendTimerCount.value--;
  }

  void resetResendTimerCount() {
    mResendTimerCount = 5.obs;
  }
}
