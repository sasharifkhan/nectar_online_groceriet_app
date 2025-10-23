import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:nectar_online_groceriet_app/ui/pages/splashscreen.dart';

void main() {
  runApp( MyApp());
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
