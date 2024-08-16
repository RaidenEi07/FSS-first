import 'package:flutter/material.dart';
import 'customRow.dart';
import 'BuildCell.dart';
import 'footer.dart';
import 'Stock.dart';
import 'SelectionRow.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SelectionRowModel()),
      ],
      child: MyApp(),
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
          backgroundColor: const Color(0xFF28242C),
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.amber[800],
          unselectedItemColor: Colors.grey,
        ),
      ),
      home: Container(
        child: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BIDV Security'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              // Xử lý khi nhấn nút refresh
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            CustomRow(),
            SizedBox(height: 20),
            Container(
              color: Colors.black,
              padding: EdgeInsets.symmetric(vertical:12.0),
              child:Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Row(
                  children: [
                    Expanded(child: buildCell('Cell 1', 'Bold Text', 'Red Text', 'Normal Text')),
                    SizedBox(width: 20),
                    Expanded(child: buildCell('Cell 2', 'Bold Text', 'Red Text', 'Normal Text')),
                  ],
                ),
              ),
            ),
            Expanded(
              child: StockApp(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomFooter(),
    );
  }
}







