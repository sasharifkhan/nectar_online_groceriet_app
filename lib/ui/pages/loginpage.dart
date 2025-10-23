import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nectar_online_groceriet_app/ui/widgets/plainedtextfield.dart';
import 'package:nectar_online_groceriet_app/ui/widgets/rectangleroundedbutton.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage('lib/assets/images/login_page_bg.png'),fit: BoxFit.cover)),child: 
      Center(child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 40,bottom: 50),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,  crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(child: Image(image: AssetImage("lib/assets/icons/nectar_icon_red.png"),height: 55, width: 47,)),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Log In",style: TextStyle(fontSize: 26),),
            Text("Enter your emails and password",style: TextStyle(fontSize: 16),),
          ],),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Email",style: TextStyle(fontSize: 16),),
            Plainedtextfield(textboxHintText: "email@example.com"),
          ],),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Password",style: TextStyle(fontSize: 16),),
            Plainedtextfield(textboxHintText: "*********",textboxIcon: Icon(Icons.visibility_off),),
            SizedBox(height: 10,),
            Align(alignment: AlignmentGeometry.centerRight, child: RichText(text: TextSpan(text: "Forgot Password?",style: TextStyle(fontSize: 14),recognizer: TapGestureRecognizer()..onTap = (){}),)),
          ],),
          Column(children: [
            Rectangleroundedbutton(buttonName: "Log IN",callback: () {},buttonbgcolor: Color(0xFF53B175),),
            SizedBox(height: 20,),
            Rectangleroundedbutton(buttonicon: Image(image: AssetImage("lib/assets/icons/google_icon.png"),height: 24,width: 24,), buttonName: "Continue with Google",callback: () {},buttonbgcolor: Color(0xFF5383EC),),
          ],),
          Center(
            child: RichText(text: TextSpan(children: [
              TextSpan(text: "Don’t have an account? ",style: TextStyle(fontSize: 14)),
              TextSpan(text: "Singup", style: TextStyle(fontSize: 14,color: Color(0xFF53B175)),recognizer: TapGestureRecognizer()..onTap= (){})
            ])),
          )
        ],),
      ),),),
    );
  }
}