import 'dart:async';

import 'package:google_sign_in/google_sign_in.dart';

class FirebaseLogin {
  Future firebaselogin()async {
    final signIn = GoogleSignIn.instance;

    await signIn.initialize(
    );
    await signIn.authenticate();
  
  }
}