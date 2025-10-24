import 'package:flutter/foundation.dart';

class Providerdata extends ChangeNotifier {
  bool _passwordshow = false;

  bool get passwordshowdetais => _passwordshow;
  void tooglePasswordShowHide(){
    _passwordshow = !_passwordshow;
    notifyListeners();
  }

}