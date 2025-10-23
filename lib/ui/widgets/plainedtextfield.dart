import 'package:flutter/material.dart';

class Plainedtextfield extends StatelessWidget {

  final String textboxHintText;
  final Icon? textboxIcon;

  const Plainedtextfield({super.key, required this.textboxHintText, this.textboxIcon});
  


  @override
  Widget build(BuildContext context) {
    return textboxIcon != null ? TextField(decoration: InputDecoration(hintText: textboxHintText,suffixIcon: IconButton(onPressed: (){}, icon: textboxIcon!)),):  
    TextField(decoration: InputDecoration(hintText: textboxHintText),) ;
  }
}