import 'package:Nectar/ui/widgets/bottomnavitems.dart';
import 'package:flutter/material.dart';
import 'package:Nectar/logic/applogic/appscreenswitch.dart';
import 'package:Nectar/ui/pages/shopscreen.dart';
import 'package:provider/provider.dart';


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
      bottomNavigationBar: BottomNavItems(),
    );
  }
}

