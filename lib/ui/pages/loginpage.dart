// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nectar_online_groceriet_app/logic/auth/authentication.dart';
import 'package:nectar_online_groceriet_app/ui/pages/selectlocation.dart';
import 'package:nectar_online_groceriet_app/ui/pages/singuppage.dart';
import 'package:nectar_online_groceriet_app/ui/widgets/plainedtextfield.dart';
import 'package:nectar_online_groceriet_app/ui/widgets/rectangleroundedbutton.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  var InputEmail = TextEditingController();
  var InputPassword = TextEditingController();

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
            Plainedtextfield(textboxHintText: "email@example.com",controller: InputEmail,),
          ],),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Password",style: TextStyle(fontSize: 16),),
            Plainedtextfield(controller: InputPassword, textboxHintText: "*********",textboxIcon: Icon(Icons.visibility_off),),
            SizedBox(height: 10,),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              RichText(text: TextSpan(text: "Forgot Password?",style: TextStyle(fontSize: 14),recognizer: TapGestureRecognizer()..onTap = (){}),),
            ],)
          ],),
          Column(children: [
            Rectangleroundedbutton(buttonName: "Log IN",callback: () async {
              var LoginData = await LoginCheck().Login(InputEmail.text,InputPassword.text);
              if(LoginData == true){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Selectlocation(),));
              } else{
                showDialog(context: context, builder: (context) {
                  return AlertDialog(title: Text("Login Error"),);
                },);
              }
              
            },buttonbgcolor: Color(0xFF53B175),),
            SizedBox(height: 20,),
            Rectangleroundedbutton(buttonicon: Image(image: AssetImage("lib/assets/icons/google_icon.png"),height: 24,width: 24,), buttonName: "Continue with Google",callback: () {},buttonbgcolor: Color(0xFF5383EC),),
          ],),
          Center(
            child: RichText(text: TextSpan(children: [
              TextSpan(text: "Don’t have an account? ",style: TextStyle(fontSize: 14,color: Colors.black)),
              TextSpan(text: "SignUp", style: TextStyle(fontSize: 14,color: Color(0xFF53B175)),recognizer: TapGestureRecognizer()..onTap= (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Singuppage(),));
              })
            ])),
          )
        ],),
      ),),),
    );
  }
}