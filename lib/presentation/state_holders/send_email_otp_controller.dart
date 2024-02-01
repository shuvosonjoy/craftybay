import 'package:craftybay/data/models/response_data.dart';
import 'package:craftybay/data/services/nerwork_caller.dart';
import 'package:craftybay/data/utility/urls.dart';
import 'package:get/get.dart';

class SendEmailOtpController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  bool get inProgress => _inProgress;
  String get errorMessage => _errorMessage;

  Future<bool> sendOtpEmail(String email) async {
    _inProgress = true;
    update();
    ResponseData response =
        await NetworkCaller().getRequest(Urls.sentEmailOtp(email));
    _inProgress = false;
    if (response.isSuccess) {
      update();
      return true;
    } else {
      errorMessage: response.errorMessage;
      update();
      return false;
    }
  }
}
