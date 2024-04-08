import 'package:craftybay/data/models/profiel.dart';
import 'package:craftybay/data/utility/urls.dart';
import 'package:craftybay/presentation/state_holders/read_profile_data_controller.dart';
import 'package:get/get.dart';
import 'package:craftybay/data/services/nerwork_caller.dart';

class VerifyOtpController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  bool _shouldNavigateCompleteProfile = true;


  bool get inProgress => _inProgress;
  String get errorMessage => _errorMessage;
  bool get shouldNavigateCompleteProfile => _shouldNavigateCompleteProfile;


  Future<bool> verifyOTP(String email, String otp) async {
    _inProgress = true;
    update();

    final response =
        await NetworkCaller().getRequest(Urls.verifyOTP(email, otp));
    _inProgress = false;

    if (response.isSuccess) {
      final token = response.responseData['data'];
      _shouldNavigateCompleteProfile =
          await Get.find<ReadProfileDataController>().readProfileData(token);
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}
