import 'package:flutter/foundation.dart';

class Providerdata extends ChangeNotifier {
  bool _passwordshow = false;

  bool get passwordshowdetais => _passwordshow;
  void tooglePasswordShowHide(){
    _passwordshow = !_passwordshow;
    notifyListeners();
  }

  bool _isLogin = false;
  String? _token;

  bool get isLogin => _isLogin;
  String? get token => _token;
  void logedIn(String token){
    _isLogin = true;
    _token = token;
    notifyListeners();

  }




}