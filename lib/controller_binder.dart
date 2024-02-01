import 'package:craftybay/presentation/state_holders/send_email_otp_controller.dart';
import 'package:get/get.dart';
import 'presentation/state_holders/main_bottom_nav_controller.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(SendEmailOtpController());
  }
}
