import 'package:flutter/material.dart';
import 'HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BIDV Security App',
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF28242C),
        scaffoldBackgroundColor: const Color(0xFF28242C),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF28242C),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.amber[800],
          unselectedItemColor: Colors.grey,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}























