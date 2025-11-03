import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, automaticallyImplyLeading: false, title: Center(child: Text("Favorite",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
      bottom: PreferredSize(preferredSize: Size.fromHeight(1),  child: Container(color: Colors.grey.shade300, height: 2,)),),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: ListView.separated(itemCount: 12, scrollDirection: Axis.vertical, itemBuilder: (context, index) => ListTile(
          contentPadding: EdgeInsets.zero,
          minTileHeight: 80,
          leading: Image(image: AssetImage("lib/assets/productimages/sprice_can.png"),height: 55, width: 55,),
          title: Text("Sprite Can"),
          subtitle: Text("325ml, Price"),
          trailing: Row(mainAxisSize: MainAxisSize.min, children: [
            Text("#1.50",style: TextStyle(fontSize: 16),),
            IconButton(onPressed: (){}, icon: Icon(Icons.arrow_right,size: 40,))
          ],),
        ), separatorBuilder: (BuildContext context, int index) { return Divider(height: 2,); },),
      ),

    );
  }
}