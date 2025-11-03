import 'package:Nectar/logic/applogic/appscreenswitch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavItems extends StatelessWidget {
  const BottomNavItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Appscreenswitch>(builder: (ctx, provider, _) {
      return Container(height: 100, decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)), child: ClipRRect(borderRadius: BorderRadius.circular(16), child: BottomNavigationBar(type: BottomNavigationBarType.fixed, selectedItemColor: Color(0xFF53B175), backgroundColor: Colors.white, currentIndex: provider.selectedIndex, onTap: (index) => provider.appscreenswitch(index), items: [
        BottomNavigationBarItem(label: "Shop", icon: ImageIcon(AssetImage("lib/assets/icons/shop.png"), size: 24),),
        BottomNavigationBarItem(label: "Explore", icon: ImageIcon(AssetImage("lib/assets/icons/explore.png"), size: 24),),
        BottomNavigationBarItem(label: "Cart", icon: ImageIcon(AssetImage("lib/assets/icons/cart.png"), size: 24),),
        BottomNavigationBarItem(label: "Favorite", icon: ImageIcon(AssetImage("lib/assets/icons/favorite.png"), size: 24),),
        BottomNavigationBarItem(label: "Account", icon: ImageIcon(AssetImage("lib/assets/icons/account.png"), size: 24),),
    ]),),);
    },);
  }
}