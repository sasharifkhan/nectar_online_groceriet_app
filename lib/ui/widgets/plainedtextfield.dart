import 'package:flutter/material.dart';

class Plainedtextfield extends StatelessWidget {

  final String textboxHintText;
  final Icon? textboxIcon;
  final TextEditingController?controller;


  const Plainedtextfield({super.key, required this.textboxHintText, this.textboxIcon, this.controller});
  


  @override
  Widget build(BuildContext context) {
    return textboxIcon != null ? TextField(controller: controller, decoration: InputDecoration(hintText: textboxHintText,suffixIcon: IconButton(onPressed: (){}, icon: textboxIcon!)),):  
    TextField(controller: controller, decoration: InputDecoration(hintText: textboxHintText),) ;
  }
}