import 'package:flutter/material.dart';
import 'Screens/farm_tracker_screen.dart';


void main() {
  runApp(AlbionManagerApp());
}

class AlbionManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Albion Manager',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: FarmTrackerScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
