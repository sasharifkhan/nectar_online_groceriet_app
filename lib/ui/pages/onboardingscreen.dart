import 'package:flutter/material.dart';

class Onboardingscreen extends StatelessWidget {
  const Onboardingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container( decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("lib/assets/images/onboarding_bg_image.png"),fit: BoxFit.cover,)), height: double.infinity, width: double.infinity,child: Column(children: [
          Text("Welcome\nto our store",style: TextStyle(fontSize: 48,color: Colors.white),textAlign: TextAlign.center,),
          Text("Ger your groceries in as fast as one hour",style: TextStyle(fontSize: 16,color: Color(0xFFFCFCFCB2)),),
          
        ],), ),


    );
  }
}