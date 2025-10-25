import 'package:flutter/material.dart';
import 'package:nectar_online_groceriet_app/ui/widgets/searchbox.dart';
import 'package:carousel_slider/carousel_slider.dart';



class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Padding(
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
          Searchbox(),
          // CarouselSlider(items: [], options: CarouselOptions())

        ],),
      ),),
    );
  }
}