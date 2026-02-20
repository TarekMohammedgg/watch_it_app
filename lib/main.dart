import 'package:flutter/material.dart';
import 'package:watch_it_app/screens/home_screen.dart';

void main() {
  runApp(const WatchItApp());
}

class WatchItApp extends StatelessWidget {
  const WatchItApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Watch It App",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
      ),
      home: HomeScreen(),
    );
  }
}
