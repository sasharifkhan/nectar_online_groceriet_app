import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:Nectar/ui/widgets/grocerieslist.dart';
import 'package:Nectar/ui/widgets/productitemsgridview.dart';
import 'package:Nectar/ui/widgets/searchbox.dart';

class Shopscreen extends StatelessWidget {
  const Shopscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(children: [
        Center(child: Padding(
        padding: const EdgeInsets.only(top: 40,left: 20,right: 20),
        child: Column(children: [
          Image(image: AssetImage("lib/assets/icons/nectar_icon_red.png"),height: 30, width: 26,),
          SizedBox(height: 8,),
          Row( mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage("lib/assets/icons/location_icon.png"),height: 18,width: 15,),
              SizedBox(width: 10,),
              Text("Dhaka, Banassre"),
            ],
          ),
          SizedBox(height: 20,),
          const Searchbox(),
          SizedBox(height: 20,),
          SizedBox(height: 115, width: double.infinity,
            child: CarouselSlider(items: [
              Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)), child: ClipRRect(child: Image(image: AssetImage("lib/assets/images/banner.png"),fit: BoxFit.cover,width: double.infinity,)),)
            ], options: CarouselOptions(viewportFraction: 1)),
          ),
          SizedBox(height: 20,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Exclusive Offer",style: TextStyle(fontSize: 24,color: Colors.black,fontWeight: FontWeight.bold),),
            Text("See all",style: TextStyle(fontSize: 16,color: Color(0xFF53B175)),)
          ],),
          SizedBox(height: 10,),
          ProductItemsGridview(itemCount: 5,productname: "Organic Bananas",productdescription: '7pcs, Priceg',productprice: "#4.99",productimage: AssetImage("lib/assets/productimages/banana.png"),),
          SizedBox(height: 10,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Best Selling",style: TextStyle(fontSize: 24,color: Colors.black,fontWeight: FontWeight.bold),),
            Text("See all",style: TextStyle(fontSize: 16,color: Color(0xFF53B175)),)
          ],),
          SizedBox(height: 10,),
          ProductItemsGridview(itemCount: 5,productname: "Organic Bananas",productdescription: '7pcs, Priceg',productprice: "#4.99",productimage: AssetImage("lib/assets/productimages/banana.png"),),
          SizedBox(height: 10,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Groceries",style: TextStyle(fontSize: 24,color: Colors.black,fontWeight: FontWeight.bold),),
            Text("See all",style: TextStyle(fontSize: 16,color: Color(0xFF53B175)),)
          ],),
          SizedBox(height: 10,),
          Grocerieslist(),
          SizedBox(height: 10,),
          ProductItemsGridview(itemCount: 5,productname: "Organic Bananas",productdescription: '7pcs, Priceg',productprice: "#4.99",productimage: AssetImage("lib/assets/productimages/banana.png"),),
        ],),
      ),)
      ],),

    );
  }
}