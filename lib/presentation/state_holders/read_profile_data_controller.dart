import 'package:craftybay/data/services/nerwork_caller.dart';
import 'package:craftybay/data/utility/urls.dart';
import 'package:get/get.dart';

class ReadProfileDataController extends GetxController{
  bool _inProgress= false;
  String _errorMessage = '';
  bool get inProgress => _inProgress;
  String get errorMessage =>_errorMessage;

  Future<bool> readProfileData(String token) async{
    _inProgress= true;
    update();

    final response= await NetworkCaller().getRequest(Urls.readProfile,token: token);
    _inProgress = false;

    if(response.isSuccess){

      final token = response.responseData['data'];
      if(token==null){
        return false;
      }
      else{
        update();
        return true;
      }

    }
    else{
      _errorMessage=response.errorMessage;
      update();
      return false;
    }
  }
}