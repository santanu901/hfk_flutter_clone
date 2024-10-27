import 'package:get/get.dart';

class VerifyOtpController extends GetxController {
  RxInt mResendTimerCount = 45.obs;

  void decrementResendTimerCount() {
    if(mResendTimerCount > 0) {
      mResendTimerCount.value--;
    }
  }

  void resetResendTimerCount() {
    mResendTimerCount.value = 45;
  }
}
