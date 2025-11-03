// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:Nectar/logic/auth/authentication.dart';
import 'package:Nectar/logic/auth/providerdata.dart';
import 'package:Nectar/ui/pages/forgetpassword.dart';
import 'package:Nectar/ui/pages/selectlocation.dart';
import 'package:Nectar/ui/pages/singuppage.dart';
import 'package:Nectar/ui/widgets/plainedtextfield.dart';
import 'package:Nectar/ui/widgets/rectangleroundedbutton.dart';
import 'package:provider/provider.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  var InputUsername = TextEditingController();
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
            Text("Enter your username and password",style: TextStyle(fontSize: 16),),
          ],),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Username",style: TextStyle(fontSize: 16),),
            Plainedtextfield(textboxHintText: "Enter your username.",controller: InputUsername,),
          ],),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Password",style: TextStyle(fontSize: 16),),
            Consumer<Providerdata>(builder: (ctx, provider, child) {
              bool passwordshowdetais = provider.passwordshowloigndetaislogin;
              return Plainedtextfield(callback: () {
              provider.tooglePasswordShowHideLogin();
            }, obs: passwordshowdetais, controller: InputPassword, textboxHintText: "Enter your password",textboxIcon: passwordshowdetais == true? Icon(Icons.visibility_off):Icon(Icons.visibility),);
            },),
            SizedBox(height: 10,),
            Consumer<Providerdata>(builder: (_, provider, _) {
              String messagelogin = provider.messagelogin;
              return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(messagelogin,style: TextStyle(color: Colors.red,fontSize: 14),),
              RichText(text: TextSpan(text: "Forgot Password?",style: TextStyle(fontSize: 14,color: Colors.black),recognizer: TapGestureRecognizer()..onTap = (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetpasswordPage(),));
              }),),
            ],);
            },),
          ],),
          Column(children: [
            Consumer<Providerdata>(builder: (_, provider, _) {
              return Rectangleroundedbutton(buttonName: "Log IN",callback: () async {
                if (InputUsername.text.isNotEmpty && InputPassword.text.isNotEmpty){
                  var messagelogin = await LoginCheck().Login(InputUsername.text,InputPassword.text);
                  provider.logincheck(messagelogin);
                  if(messagelogin == "Login successful"){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Selectlocation(),));
                  }
                }

            },buttonbgcolor: Color(0xFF53B175),);
            },),
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