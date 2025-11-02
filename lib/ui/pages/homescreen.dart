import 'package:flutter/material.dart';
import 'package:nectar_online_groceriet_app/logic/applogic/appscreenswitch.dart';
import 'package:nectar_online_groceriet_app/ui/pages/shopscreen.dart';
import 'package:provider/provider.dart';
// import 'package:carousel_slider/carousel_slider.dart';



class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<Appscreenswitch>(builder: (ctx, provider, _) {
        return IndexedStack( index: provider.selectedIndex,
        children: [
          Shopscreen(),
          Center(child: Text("Explore")),
          Center(child: Text("Cart")),
          Center(child: Text("Favorite")),
          Center(child: Text("Account")),
        ],
      );
      },),
      bottomNavigationBar: Consumer<Appscreenswitch>(builder: (ctx, provider, _) {
        return Container(height: 70, decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)), child: ClipRRect(borderRadius: BorderRadius.circular(16), child: BottomNavigationBar(type: BottomNavigationBarType.fixed, selectedItemColor: Color(0xFF53B175), backgroundColor: Colors.white, currentIndex: provider.selectedIndex, onTap: (index) => provider.appscreenswitch(index), items: [
          BottomNavigationBarItem(label: "Shop", icon: ImageIcon(AssetImage("lib/assets/icons/shop.png"), size: 24),),
          BottomNavigationBarItem(label: "Explore", icon: ImageIcon(AssetImage("lib/assets/icons/explore.png"), size: 24),),
          BottomNavigationBarItem(label: "Cart", icon: ImageIcon(AssetImage("lib/assets/icons/cart.png"), size: 24),),
          BottomNavigationBarItem(label: "Favorite", icon: ImageIcon(AssetImage("lib/assets/icons/favorite.png"), size: 24),),
          BottomNavigationBarItem(label: "Account", icon: ImageIcon(AssetImage("lib/assets/icons/account.png"), size: 24),),
      ]),),);
      },),
    );
  }
}