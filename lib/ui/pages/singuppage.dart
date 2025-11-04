// ignore_for_file: avoid_print

import 'package:Nectar/ui/pages/loginpage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:Nectar/logic/auth/authentication.dart';
import 'package:Nectar/logic/auth/providerdata.dart';
import 'package:Nectar/ui/pages/selectlocation.dart';
import 'package:Nectar/ui/widgets/plainedtextfield.dart';
import 'package:Nectar/ui/widgets/rectangleroundedbutton.dart';
import 'package:provider/provider.dart';

class Singuppage extends StatefulWidget {
  const Singuppage({super.key});

  @override
  State<Singuppage> createState() => _SinguppageState();
}

class _SinguppageState extends State<Singuppage> {
  var signupUsername = TextEditingController();
  var signupUserfirstname = TextEditingController();
  var signupUserlastname = TextEditingController();
  var signupEmail  = TextEditingController();
  var signupPassword = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage("lib/assets/images/login_page_bg.png"),fit: BoxFit.cover)),child: Center(child: Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 40,bottom: 50),
      child: ListView(children: [
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(child: Image(image: AssetImage("lib/assets/icons/nectar_icon_red.png"),height: 55, width: 47,)),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Sign Up",style: TextStyle(fontSize: 26),),
            Text("Enter your credentials to continue",style: TextStyle(fontSize: 16),),
          ],),
          SizedBox(height: 40,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("First Name",style: TextStyle(fontSize: 16),),
                Plainedtextfield(keyboardType: TextInputType.name, controller: signupUserfirstname, textboxHintText: "Enter your first name."),
              ],),
            ),
            SizedBox(width: 20,),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("Last Name",style: TextStyle(fontSize: 16),),
                Plainedtextfield(keyboardType: TextInputType.name,controller: signupUserlastname, textboxHintText: "Enter your last name."),
              ],),
            )
          ],),
          SizedBox(height: 40,),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Username",style: TextStyle(fontSize: 16),),
            Plainedtextfield(keyboardType: TextInputType.name, controller: signupUsername, textboxHintText: "Enter your username."),
          ],),
          SizedBox(height: 40,),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Email",style: TextStyle(fontSize: 16),),
          Plainedtextfield(keyboardType: TextInputType.emailAddress, controller: signupEmail, textboxHintText: "email@example.com"),
          ],),
          SizedBox(height: 40,),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Password",style: TextStyle(fontSize: 16),),
          Consumer<Providerdata>(builder: (ctx, provider, child) {
            bool passwordshowdetais = provider.passwordshowloigndetaisreg;
            return Plainedtextfield(keyboardType: TextInputType.visiblePassword, callback: () {
              provider.tooglePasswordShowHideReg();
            }, obs: passwordshowdetais, controller: signupPassword, textboxHintText: "*********",textboxIcon: passwordshowdetais==false?Icon(Icons.visibility):Icon(Icons.visibility_off),);
          },),
          SizedBox(height: 30,),
          Consumer<Providerdata>(builder: (ctx, provider, _) {
            String message =  provider.message;
            return Text(message,style: TextStyle(color: Colors.red, fontSize: 14),);
          },),
          RichText(text: TextSpan(children: [
            TextSpan(text: "By continuing you agree to our ", style: TextStyle(color: Colors.black)),
            TextSpan(text: "Terms of Service",style: TextStyle(color: Color(0xFF53B175)),recognizer: TapGestureRecognizer()..onTap=(){}),
            TextSpan(text: " and ", style: TextStyle(color: Colors.black)),
            TextSpan(text: "Privacy Policy.",style: TextStyle(color: Color(0xFF53B175)),recognizer: TapGestureRecognizer()..onTap=(){})
            ])),
            SizedBox(height: 30,),
        ],),
      
        Consumer<Providerdata>(builder: (ctx, provider, _) {
          return Rectangleroundedbutton(buttonName: 'Sign Up', buttonbgcolor: Color(0xFF53B175), callback: () async {
            if(signupUserfirstname.text.isNotEmpty && signupUserlastname.text.isNotEmpty && signupUsername.text.isNotEmpty && signupEmail.text.isNotEmpty && signupPassword.text.isNotEmpty){
              var message = await RegisterNew().register(signupUserfirstname.text,signupUserlastname.text,signupUsername.text,signupEmail.text,signupPassword.text);
              provider.registrationcheck(message);
              if (message == 'Registration successful'){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Selectlocation(),));
              } 
            }
        });
        },),
        SizedBox(height: 30,),
        Center(
          child: RichText(text: TextSpan(children: [
            TextSpan(text: "Already have an account? ",style: TextStyle(fontSize: 14,color: Colors.black)),
            TextSpan(text: "Login", style: TextStyle(fontSize: 14,color: Color(0xFF53B175)),recognizer: TapGestureRecognizer()..onTap= (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Loginpage(),));
            })
          ])),
        )
      ],)
      ],),
            ),),),
    );
  }
}