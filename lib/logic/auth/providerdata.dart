import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';

class Providerdata extends ChangeNotifier {


///////////////////////Password Show Hide LoginPage/////////////////////////////
  bool _passwordshowlogin = false;
  bool get passwordshowloigndetaislogin => _passwordshowlogin;

  void tooglePasswordShowHideLogin(){
    _passwordshowlogin = !_passwordshowlogin;
    notifyListeners();
  }
///////////////////////Password Show Hide RegPage/////////////////////////////
  bool _passwordshowreg = false;
  bool get passwordshowloigndetaisreg => _passwordshowreg;

  void tooglePasswordShowHideReg(){
    _passwordshowreg = !_passwordshowreg;
    notifyListeners();
  }
///////////////////////////Save Curent Location/////////////////////////////
  String? _currentlocation;
  String? get currentlocation => _currentlocation;

  void saveLocation(currentlocation){
    _currentlocation = currentlocation;
    notifyListeners();
  }
/////////////////////////Registration Check///////////////////////////
  String _message = '';
  String get message => _message;

  void registrationcheck(message){
    _message = message;
    notifyListeners();
  }
///////////////////////////Login Check/////////////////////////

  String _messagelogin = '';
  String get messagelogin => _messagelogin;

  void logincheck(messagelogin){
    _messagelogin = messagelogin;
    notifyListeners();
  }
////////////////////////////Remove Auth Token////////////////////////

  void tokenremove(){
    GetStorage().remove('token');
    GetStorage().remove('location');
    notifyListeners();
  }

}