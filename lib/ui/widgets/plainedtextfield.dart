import 'package:flutter/material.dart';

class Plainedtextfield extends StatelessWidget {

  final String textboxHintText;
  final Icon? textboxIcon;
  final TextEditingController?controller;
  final bool? obs;


  const Plainedtextfield({super.key, required this.textboxHintText, this.textboxIcon, this.controller, this.obs});
  


  @override
  Widget build(BuildContext context) {
    return textboxIcon != null ? TextField(controller: controller, decoration: InputDecoration(hintText: textboxHintText,suffixIcon: IconButton(onPressed: (){}, icon: textboxIcon!)),obscureText: obs!,):  
    TextField(controller: controller, decoration: InputDecoration(hintText: textboxHintText,),) ;
  }
}