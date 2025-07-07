import 'package:flutter/material.dart';
import 'Screens/home_screen.dart';
import 'Screens/farm_screen.dart';
import 'Screens/workers_screen.dart';
import 'Screens/crop_screen.dart';
import 'Screens/activities_screen.dart';
import 'Screens/refine_screen.dart';

void main() {
  runApp(AlbionManagerApp());
}

class AlbionManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Albion Manager',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/farm': (context) => FarmScreen(),
        '/crop': (context) => CropScreen(),
        // Aquí luego agregás: '/workers': (context) => WorkersScreen(), ...
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
