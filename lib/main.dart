// ignore_for_file: unused_import

import 'package:Nectar/logic/auth/authentication.dart';
import 'package:Nectar/logic/providers/getproductcategoresprovider.dart';
import 'package:Nectar/logic/providers/getproductsprovider.dart';
import 'package:Nectar/logic/providers/locationprovider.dart';
import 'package:Nectar/logic/providers/profiledetailsprovider.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:Nectar/logic/applogic/appscreenswitch.dart';
import 'package:Nectar/logic/auth/providerdata.dart';
import 'package:Nectar/ui/pages/homescreen.dart';
import 'package:Nectar/ui/pages/selectlocation.dart';
import 'package:Nectar/ui/pages/splashscreen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  final token = GetStorage().read('token');
  final location = GetStorage().read('location');

  // final token2 = GetStorage().remove('token');
  String route;
  if(token != null && location != null){
    route = 'alreadyhavelocation';
  } else if (token != null && location == null ){
    route = 'alreadyloggedin';
  } else {
    route = 'login';
  }

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => Appscreenswitch()),
    ChangeNotifierProvider(create: (context) => Providerdata(),),
    ChangeNotifierProvider(create: (context) => Locationprovider(),),
    ChangeNotifierProvider(create: (context) => Profiledetailsprovider(),),
    ChangeNotifierProvider(create: (context) => Getproductcategoresprovider(),),
    ChangeNotifierProvider(create: (context) => Getproductsprovider())
  ],child: MyApp(initialRoute: route), ));
    // runApp(DevicePreview(builder: (context) => MyApp(),));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({super.key, required this.initialRoute});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,routes: {
        'login' : (_)=> Splashscreen(),
        'alreadyloggedin': (_)=> Selectlocation(),
        'alreadyhavelocation': (_)=> Homescreen()
      },
      title: 'nectar',
      theme: ThemeData(),
    );
  }
}
