// ignore_for_file: unused_import

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nectar_online_groceriet_app/logic/auth/providerdata.dart';
import 'package:nectar_online_groceriet_app/ui/pages/splashscreen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp( ChangeNotifierProvider(create: (context) => Providerdata(),child: MyApp(),));
  // runApp(DevicePreview(builder: (context) => MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'nectar',
      theme: ThemeData(),
      home: const Splashscreen(),
    );
  }
}
