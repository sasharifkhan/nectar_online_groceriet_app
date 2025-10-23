import 'package:flutter/material.dart';
import 'package:nectar_online_groceriet_app/ui/widgets/rectangleroundedbutton.dart';

class Selectlocation extends StatefulWidget {
  const Selectlocation({super.key});

  @override
  State<Selectlocation> createState() => _SelectlocationState();
}

class _SelectlocationState extends State<Selectlocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.transparent, ),
      body: Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage("lib/assets/images/login_page_bg.png"),fit: BoxFit.cover)),child: Center(child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 80,bottom: 50),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            InkWell(onTap: () {}, child: Image(image: AssetImage("lib/assets/images/select_location_img.png"),height: 170, width: 225,)),
            SizedBox(height: 40,),
            Text("Select Your Location",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
            SizedBox(height: 15,),
            Text("Switch on your location to stay in tune with what’s happening in your area",style: TextStyle(fontSize: 16),textAlign: TextAlign.center,),
          ],),
          Rectangleroundedbutton(buttonName: 'Submit', buttonbgcolor: Color(0xFF53B175), callback: (){})
        ],),
      ),),),
    );
  }
}