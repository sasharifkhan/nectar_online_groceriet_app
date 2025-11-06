// ignore_for_file: avoid_print

import 'package:Nectar/logic/providers/locationprovider.dart';
import 'package:flutter/material.dart';
import 'package:Nectar/ui/pages/homescreen.dart';
import 'package:Nectar/ui/widgets/rectangleroundedbutton.dart';
import 'package:provider/provider.dart';

class Selectlocation extends StatefulWidget {
  const Selectlocation({super.key});

  @override
  State<Selectlocation> createState() => _SelectlocationState();
}

class _SelectlocationState extends State<Selectlocation> {
  String? locationname;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      
      appBar: AppBar(backgroundColor: Colors.transparent, leading: IconButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen(),));
      }, icon: Image(image: AssetImage("lib/assets/icons/back arrow.png"),height: 18,width: 10,)), ),

      body: Stack(children: [
        Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage("lib/assets/images/login_page_bg.png"),fit: BoxFit.cover)),child: Center(child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 80,bottom: 50),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Image(image: AssetImage("lib/assets/images/select_location_img.png"),height: 170, width: 225,),
            SizedBox(height: 40,),
            Text("Select Your Location",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
            SizedBox(height: 15,),
            Text("Switch on your location to stay in tune with what’s happening in your area",style: TextStyle(fontSize: 16),textAlign: TextAlign.center,),
          ],),
          Rectangleroundedbutton(buttonName: 'Submit', buttonbgcolor: Color(0xFF53B175), callback: ()async{
            setState(() {
              isLoading = true;
            });
            await Provider.of<Locationprovider>(listen: false, context).getloctionfromdevice();
            setState(() {
              isLoading = false;
            });
            Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen(),));
          })
        ],),
      ),),),
      if (isLoading == true)Container(decoration: BoxDecoration(color: Colors.black45,), child: Center(child: CircularProgressIndicator(color: Colors.white,)),)
      ],),
    );
  }
}