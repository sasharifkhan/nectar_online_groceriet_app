import 'package:Nectar/ui/widgets/categoriesproductgridview.dart';
import 'package:flutter/material.dart';

class Categoriesproduct extends StatelessWidget {
  const Categoriesproduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(child: Text("Beverages",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.filter_list))
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20,left: 20,right: 20),
        child: Categoriesproductgridview(productname: "Banana", productdescription: "productdescription", productprice: "# 1.99", itemCount: 10, productimage: AssetImage("lib/assets/productimages/banana.png")),
      ),

    );
  }
}