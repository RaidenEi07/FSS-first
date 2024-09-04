import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:no1/Provider/Stock-provider.dart';
import 'package:no1/Display/HomeScreen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => StockProvider(),
      child: const MyApp(),
    ),
  );
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





Widget buildCell(
    String cellName, String boldText, String redText, String normalText) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    decoration: BoxDecoration(
      color: Colors.white12,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            cellName,
            style:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                boldText,
                style: const TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.white),
              ),
              const SizedBox(width: 8),
              Text(
                redText,
                style: const TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(normalText, style: const TextStyle(color: Colors.white)),
        ),
      ],
    ),
  );
}










