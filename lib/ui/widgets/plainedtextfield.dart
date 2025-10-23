import 'package:flutter/material.dart';

class Plainedtextfield extends StatelessWidget {

  final String textboxHintText;
  final Icon? textboxIcon;

  const Plainedtextfield({super.key, required this.textboxHintText, this.textboxIcon});
  


  @override
  Widget build(BuildContext context) {
    return TextField(decoration: InputDecoration(hintText: textboxHintText, ),);
  }
}