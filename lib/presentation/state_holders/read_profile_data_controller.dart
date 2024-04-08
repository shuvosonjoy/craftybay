import 'package:craftybay/data/models/profiel.dart';
import 'package:craftybay/data/services/nerwork_caller.dart';
import 'package:craftybay/data/utility/urls.dart';
import 'package:get/get.dart';

class ReadProfileDataController extends GetxController{

  bool _inProgress= false;
  String _errorMessage = '';
  Profile _profile =Profile();
  bool _isProfileCompleted =false;

  bool get inProgress => _inProgress;
  String get errorMessage =>_errorMessage;
  Profile get profile => _profile;
  bool get isProfileCompleted =>_isProfileCompleted;

  Future<bool> readProfileData(String token) async{
    _inProgress= true;
    update();

    final response= await NetworkCaller().getRequest(Urls.readProfile,token: token);
    _inProgress = false;

    if(response.isSuccess){

      final profileData = response.responseData['data'];

      if(token==null){
      _isProfileCompleted=false;
      }
      else{
      _profile= Profile.fromJson(profileData[0]);
       _isProfileCompleted=true;
      }
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