import 'package:bezlimit/view/screens/main_screen.dart';
import 'package:bezlimit/view/screens/select_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());
  debugRepaintRainbowEnabled = true;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (_) => const MainScreen(),
        '/element': (_) => const SelectScreen(),
      },
      initialRoute: '/',
    );
  }
}
