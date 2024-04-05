import 'package:craftybay/data/utility/urls.dart';
import 'package:get/get.dart';
import 'package:craftybay/data/services/nerwork_caller.dart';

class VerifyOtpController extends GetxController{
  bool _inProgress= false;
  String _errorMessage = '';
  bool get inProgress => _inProgress;
  String get errorMessage =>_errorMessage;

  Future<bool> verifyOTP(String email, String otp) async{
    _inProgress= true;
    update();

    final response= await NetworkCaller().getRequest(Urls.verifyOTP(email,otp));
    _inProgress = false;

    if(response.isSuccess){
      final token = response.responseData['data'];
      update();
      return true;
    }
    else{
      _errorMessage=response.errorMessage;
      update();
      return false;
    }
  }
  
}