import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BIDV Security App',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.amber[800],
          unselectedItemColor: Colors.grey,
        ),
      ),
      home: HomeScreen(),
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
            Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Row(
                  children: [
                    Expanded(child: buildCell('Cell 1', 'Bold Text', 'Red Text', 'Normal Text')),
                    SizedBox(width: 20),
                    Expanded(child: buildCell('Cell 2', 'Bold Text', 'Red Text', 'Normal Text')),
                  ],
                ),
            ),
            SizedBox(height: 20),
            Container(
              color: Colors.white12,
              child: Column(
                children: <Widget>[
                  SelectionRow(),
                  ParentRowWidget(),
                  SizedBox(height: 20),
                  ParentRowWidget(),
                  SizedBox(height: 20),
                  ParentRowWidget(),
                  SizedBox(height: 20),
                  ParentRowWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomFooter(),
    );
  }
}

class CustomRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.add, color: Colors.white),
        ),
        SizedBox(width: 20),
        DropdownButton<String>(
          hint: Text('Chọn mục 1', style: TextStyle(color: Colors.white)),
          dropdownColor: Colors.black,
          items: <String>['Mục 1', 'Mục 2', 'Mục 3'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            // Xử lý khi chọn mục 1
          },
        ),
        SizedBox(width: 20),
        DropdownButton<String>(
          hint: Text('Chọn mục 2', style: TextStyle(color: Colors.white)),
          dropdownColor: Colors.black,
          items: <String>['Mục A', 'Mục B', 'Mục C'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            // Xử lý khi chọn mục 2
          },
        ),
      ],
    );
  }
}

Widget buildCell(String cellName, String boldText, String redText, String normalText) {
  return Container(
    color: Colors.white12,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          cellName,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Row(
          children: [
            Text(
              boldText,
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
            ),
            SizedBox(width: 8),
            Text(
              redText,
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
        Text(normalText, style: TextStyle(color: Colors.white)),
      ],
    ),
  );
}

class SelectionRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[800], // Thay đổi từ primary thành backgroundColor
          ),
          onPressed: () {
            // Hành động khi chọn nút 1
            print('Mục 1 được chọn');
          },
          child: Text('A - Z ⏑'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[800], // Thay đổi từ primary thành backgroundColor
          ),
          onPressed: () {
            // Hành động khi chọn nút 2
            print('Mục 2 được chọn');
          },
          child: Text('Gía'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[800], // Thay đổi từ primary thành backgroundColor
          ),
          onPressed: () {
            // Hành động khi chọn nút 3
            print('Mục 3 được chọn');
          },
          child: Text('Khối lượng'),
        ),
      ],
    );
  }
}

class ParentRowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ChildRowWidget(
          colors: [Colors.white12, Colors.white12, Colors.white12],
          texts: ['2 parts', '1 part', '1 part'],
        ),
        ChildRowWidget(
          colors: [Colors.white12, Colors.white12, Colors.white12],
          texts: ['2 parts', '1 part', '1 part'],
        ),
      ],
    );
  }
}

class ChildRowWidget extends StatelessWidget {
  final List<Color> colors;
  final List<String> texts;

  ChildRowWidget({required this.colors, required this.texts});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Container(
            color: colors[0],
            height: 50,
            child: Center(child: Text(texts[0], style: TextStyle(color: Colors.white))),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: colors[1],
            height: 50,
            child: Center(child: Text(texts[1], style: TextStyle(color: Colors.white))),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: colors[2],
            height: 50,
            child: Center(child: Text(texts[2], style: TextStyle(color: Colors.white))),
          ),
        ),
      ],
    );
  }
}

class CustomFooter extends StatefulWidget {
  @override
  _CustomFooterState createState() => _CustomFooterState();
}

class _CustomFooterState extends State<CustomFooter> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          label: 'Messages',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      onTap: _onItemTapped,
    );
  }
}
