import 'package:flutter/material.dart';

class Grocerieslist extends StatelessWidget {
  const Grocerieslist({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 105, child: GridView.builder(itemCount: 5, scrollDirection: Axis.horizontal, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,mainAxisExtent: 250,mainAxisSpacing: 15), itemBuilder: (context, index) => Container(decoration: BoxDecoration(
            color: Color(0xFFF8A44C),
            borderRadius: BorderRadius.circular(18),
          ),child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Image(image: AssetImage("lib/assets/productimages/pulses.png"),height: 72,width: 75,),
              SizedBox(width: 10,),
              Text("Pulses",style: TextStyle(fontSize: 20,color: Colors.black),)
            ],),
          ),),));
  }
}