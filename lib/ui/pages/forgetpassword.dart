import 'package:flutter/material.dart';
import 'package:Nectar/logic/auth/authentication.dart';
import 'package:Nectar/ui/pages/forgetlinksent.dart';
import 'package:Nectar/ui/widgets/plainedtextfield.dart';
import 'package:Nectar/ui/widgets/rectangleroundedbutton.dart';

class ForgetpasswordPage extends StatefulWidget {
  const ForgetpasswordPage({super.key});

  @override
  State<ForgetpasswordPage> createState() => _ForgetpasswordPageState();
}

class _ForgetpasswordPageState extends State<ForgetpasswordPage> {
  var inputEmail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent,),
      backgroundColor: Color(0xFFFFFFFF),
      body: Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage('lib/assets/images/login_page_bg.png'),fit: BoxFit.cover)),child: 
      Center(child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 40,bottom: 50),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,  crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(child: Image(image: AssetImage("lib/assets/icons/nectar_icon_red.png"),height: 55, width: 47,)),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Forget Password",style: TextStyle(fontSize: 26),),
            Text("Enter your email to continue",style: TextStyle(fontSize: 16),),
            SizedBox(height: 30,),
            Text("Email",style: TextStyle(fontSize: 16),),
            Plainedtextfield(keyboardType: TextInputType.emailAddress,textboxHintText: "email@example.com",controller: inputEmail,),
          ],),
          Rectangleroundedbutton(buttonName: "Forget",callback: ()  async{
            if (inputEmail.text.isNotEmpty){
            int statuscode =  await ForgetPassword().forgetpassword(inputEmail.text);
            if (statuscode == 200){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Forgetlinksent(),));
            }
            }
            },buttonbgcolor: Color(0xFF53B175),),
        ],),
      ),),),
    );
  }
}