import 'package:flutter/material.dart';
import 'package:Nectar/ui/pages/loginpage.dart';
import 'package:Nectar/ui/widgets/rectangleroundedbutton.dart';

class Onboardingscreen extends StatelessWidget {
  const Onboardingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container( decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("lib/assets/images/onboarding_bg_image.png"),fit: BoxFit.cover,)), height: double.infinity, width: double.infinity,child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20,bottom: 60),
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Image(image: AssetImage("lib/assets/icons/nectar_icon.png"),height: 56,width: 48,),
            SizedBox(height: 10,),
            Text("Welcome\nto our store",style: TextStyle(fontSize: 48,color: Colors.white),textAlign: TextAlign.center,),
            Text("Ger your groceries in as fast as one hour",style: TextStyle(fontSize: 16,color: Colors.grey),),
            SizedBox(height: 25,),
            Rectangleroundedbutton(buttonName: "Get Started",buttonbgcolor: Color(0xFF53B175),callback: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Loginpage(),));
            },)
          ],),
        ), ),


    );
  }
}