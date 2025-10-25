import 'package:flutter/material.dart';

class Searchbox extends StatelessWidget {
  final Icon? suffixIcon;
  final VoidCallback? callback;
  const Searchbox({super.key, this.suffixIcon, this.callback});

  @override
  Widget build(BuildContext context) {
    return SizedBox( height: 51,
      child: TextField(
        decoration: suffixIcon != null ? InputDecoration(
          fillColor: Color(0xFFF2F3F2),filled: true,
          focusColor: Colors.red,
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: Colors.transparent)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: Colors.transparent)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: Colors.transparent)),
          prefixIcon: Icon(Icons.search_rounded,color: Colors.black,),
          hintText: "Search Store",
          suffixIcon: IconButton(onPressed: callback, icon: suffixIcon!)
          ):InputDecoration(
          fillColor: Color(0xFFF2F3F2),filled: true,
          focusColor: Colors.red,
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: Colors.transparent)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: Colors.transparent)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: Colors.transparent)),
          prefixIcon: Icon(Icons.search_rounded,color: Colors.black,),
          hintText: "Search Store",
          ),
      ),
    );
  }
}