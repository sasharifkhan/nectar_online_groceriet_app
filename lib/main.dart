// ignore_for_file: unused_import

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nectar_online_groceriet_app/logic/auth/providerdata.dart';
import 'package:nectar_online_groceriet_app/ui/pages/selectlocation.dart';
import 'package:nectar_online_groceriet_app/ui/pages/splashscreen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  final token = GetStorage().read('token');



  runApp( ChangeNotifierProvider(create: (context) => Providerdata(),child: MyApp(initialRoute: token != null ? 'alreadyloggedin':'login'),));
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
        'alreadyloggedin': (_)=> Selectlocation()
      },
      title: 'nectar',
      theme: ThemeData(),
    );
  }
}
