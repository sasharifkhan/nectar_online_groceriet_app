import 'package:flutter/material.dart';
import 'package:nectar_online_groceriet_app/logic/auth/authentication.dart';
import 'package:nectar_online_groceriet_app/ui/pages/forgetlinksent.dart';
import 'package:nectar_online_groceriet_app/ui/widgets/plainedtextfield.dart';
import 'package:nectar_online_groceriet_app/ui/widgets/rectangleroundedbutton.dart';

class ForgetpasswordPage extends StatefulWidget {
  const ForgetpasswordPage({super.key});

  @override
  State<ForgetpasswordPage> createState() => _ForgetpasswordPageState();
}

class _ForgetpasswordPageState extends State<ForgetpasswordPage> {
  var InputEmail = TextEditingController();
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
            Plainedtextfield(textboxHintText: "email@example.com",controller: InputEmail,),
          ],),
          Rectangleroundedbutton(buttonName: "Forget",callback: ()  async{
            if (InputEmail.text.isEmpty){
            } else {
            int statuscode =  await ForgetPassword().Forgetpassword(InputEmail.text);
            if (statuscode == 200){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Forgetlinksent(),));
            }}
            },buttonbgcolor: Color(0xFF53B175),),
        ],),
      ),),),
    );
  }
}