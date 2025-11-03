import 'package:flutter/material.dart';

class Categoriesproductgridview extends StatelessWidget {
  final String productname;
  final String productdescription;
  final String productprice;
  final int itemCount;
  final VoidCallback?callback;
  final AssetImage productimage;
  const Categoriesproductgridview({super.key, required this.productname, required this.productdescription, required this.productprice, required this.itemCount, this.callback, required this.productimage});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(itemCount: itemCount,padding: EdgeInsets.all(10), scrollDirection: Axis.vertical, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(mainAxisExtent: 250, mainAxisSpacing: 15, crossAxisCount: 2,crossAxisSpacing: 15), itemBuilder: (context, index) => Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Color(0xFFE2E2E2)),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(18)
            ),child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.start, children: [
                Center(child: Image(image: productimage,height: 80,width: 99,)),
                Text(productname,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                Text(productdescription,style: TextStyle(fontSize: 14),),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text(productprice,style: TextStyle(fontSize: 18,color: Colors.black),),
                  IconButton(onPressed: (){}, icon: Image(image: AssetImage("lib/assets/icons/add_button.png"),height: 45,width: 45,))
                ],)
              ],),
            ),
          ),);
  }
}