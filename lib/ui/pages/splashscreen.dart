import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nectar_online_groceriet_app/ui/pages/onboardingscreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Onboardingscreen(),));
    },);
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color(0xFF53B175),
      body: Center(child: Image(image: AssetImage('lib/assets/icons/necter_logo.png'),height: 68,width: 267))
      );
  }
}