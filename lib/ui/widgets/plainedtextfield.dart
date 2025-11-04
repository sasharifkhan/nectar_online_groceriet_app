import 'package:flutter/material.dart';

class Plainedtextfield extends StatelessWidget {

  final String textboxHintText;
  final Icon? textboxIcon;
  final TextEditingController?controller;
  final bool? obs;
  final VoidCallback?callback;
  final TextInputType keyboardType;


  const Plainedtextfield({super.key, required this.textboxHintText, this.textboxIcon, this.controller, this.obs, this.callback, required this.keyboardType});
  


  @override
  Widget build(BuildContext context) {
    return textboxIcon != null ? TextField(keyboardType: keyboardType, controller: controller, decoration: InputDecoration(hintText: textboxHintText,suffixIcon: IconButton(onPressed: callback, icon: textboxIcon!)),obscureText: obs!,):  
    TextField(controller: controller, decoration: InputDecoration(hintText: textboxHintText,),) ;
  }
}