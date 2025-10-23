// ignore_for_file: avoid_print

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nectar_online_groceriet_app/logic/auth/authentication.dart';
import 'package:nectar_online_groceriet_app/ui/pages/loginpage.dart';
import 'package:nectar_online_groceriet_app/ui/widgets/plainedtextfield.dart';
import 'package:nectar_online_groceriet_app/ui/widgets/rectangleroundedbutton.dart';

class Singuppage extends StatefulWidget {
  const Singuppage({super.key});

  @override
  State<Singuppage> createState() => _SinguppageState();
}

class _SinguppageState extends State<Singuppage> {
  var signupUsername = TextEditingController();
  var signupEmail  = TextEditingController();
  var signupPassword = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage("lib/assets/images/login_page_bg.png"),fit: BoxFit.cover)),child: Center(child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 40,bottom: 50),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Center(child: Image(image: AssetImage("lib/assets/icons/nectar_icon_red.png"),height: 55, width: 47,)),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Sign Up",style: TextStyle(fontSize: 26),),
              Text("Enter your credentials to continue",style: TextStyle(fontSize: 16),),
            ],),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Username",style: TextStyle(fontSize: 16),),
              Plainedtextfield(controller: signupUsername, textboxHintText: "S Khan"),
            ],),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Email",style: TextStyle(fontSize: 16),),
            Plainedtextfield(controller: signupEmail, textboxHintText: "email@example.com"),
          ],),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Password",style: TextStyle(fontSize: 16),),
            Plainedtextfield(controller: signupPassword, textboxHintText: "*********",textboxIcon: Icon(Icons.visibility_off),),
          ],),
          RichText(text: TextSpan(children: [
            TextSpan(text: "By continuing you agree to our "),
            TextSpan(text: "Terms of Service",style: TextStyle(color: Color(0xFF53B175)),recognizer: TapGestureRecognizer()..onTap=(){}),
            TextSpan(text: " and "),
            TextSpan(text: "Privacy Policy.",style: TextStyle(color: Color(0xFF53B175)),recognizer: TapGestureRecognizer()..onTap=(){})
            ])),
          Rectangleroundedbutton(buttonName: 'Sign Up', buttonbgcolor: Color(0xFF53B175), callback: () async {
            var registercheck = await RegisterNew().Register(signupUsername.text,signupEmail.text,signupPassword.text);
            print(registercheck);
          }),
          Center(
            child: RichText(text: TextSpan(children: [
              TextSpan(text: "Already have an account? ",style: TextStyle(fontSize: 14,color: Colors.black)),
              TextSpan(text: "Login", style: TextStyle(fontSize: 14,color: Color(0xFF53B175)),recognizer: TapGestureRecognizer()..onTap= (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Loginpage(),));
              })
            ])),
          )
          
        ],),
      ),),),
    );
  }
}