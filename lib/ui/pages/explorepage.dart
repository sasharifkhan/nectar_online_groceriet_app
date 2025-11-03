import 'package:Nectar/ui/pages/categoriesproduct.dart';
import 'package:Nectar/ui/widgets/searchbox.dart';
import 'package:flutter/material.dart';

class Explorepage extends StatelessWidget {
  const Explorepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 20,right: 20),
          child: Column(children: [
          Text("Find Products",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          Searchbox(),
          Expanded(child: GridView.builder(itemCount: 10, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15, mainAxisExtent: 190), itemBuilder: (context, index) => InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Categoriesproduct(),)), child: Container(
              decoration: BoxDecoration(
                color: Color(0x53B175B2),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Color(0x53B175B2),width: 2)
              ), child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Image(image: AssetImage("lib/assets/productimages/pulses.png"),height: 111, width: 111,),
                Text("Frash Fruits & Vegetable",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
              ],),
              ),
          ),))
          ],),
        ),
      ),
    );
  }
}