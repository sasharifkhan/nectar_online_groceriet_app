import 'package:flutter/material.dart';
import 'package:Nectar/ui/pages/loginpage.dart';
import 'package:Nectar/ui/widgets/rectangleroundedbutton.dart';

class Forgetlinksent extends StatelessWidget {
  const Forgetlinksent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage('lib/assets/images/login_page_bg.png'),fit: BoxFit.cover)),child: 
      Center(child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 40,bottom: 50),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,  crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(child: Image(image: AssetImage("lib/assets/icons/nectar_icon_red.png"),height: 55, width: 47,)),
          Text("Password reset instructions sent to your email",style: TextStyle(fontSize: 26),textAlign: TextAlign.center,),
          Rectangleroundedbutton(buttonName: "Go to Login", buttonbgcolor: Color(0xFF53B175), callback: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Loginpage(),));
          })
        ],),
      ),),),
    );
  }
}