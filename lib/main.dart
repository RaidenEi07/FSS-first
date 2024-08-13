import 'package:flutter/material.dart';
import 'stock_service.dart'; // Thay đổi đường dẫn nếu cần

void main() {
  runApp(MyApp());
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

class CustomRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 2), // Viền màu xanh
            borderRadius: BorderRadius.circular(8), // Bo góc (tùy chọn)
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.add, color: Colors.white),
          ),
        ),
        SizedBox(width: 20),
        DropdownButton<String>(
          hint: Text('Chọn mục 1', style: TextStyle(color: Colors.white)),
          dropdownColor: Colors.black,
          items: <String>['Mục 1', 'Mục 2', 'Mục 3'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Container(
                decoration:BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: Text(value),
              ),
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
    padding: EdgeInsets.symmetric(vertical: 8.0),
    decoration: BoxDecoration(
      color: Colors.white12,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child:
          Text(
            cellName,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
        ),
        Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text(normalText, style: TextStyle(color: Colors.white)),
        ),
      ],
    ),
  );
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

class StockApp extends StatefulWidget {
  @override
  _StockAppState createState() => _StockAppState();
}

class _StockAppState extends State<StockApp> {
  bool showStockList = false;
  late Future<List<Stock>> futureStocks;

  @override
  void initState() {
    super.initState();
    futureStocks = StockService().fetchStocks();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SelectionRow(
          onFirstButtonPressed: () {
            setState(() {
              showStockList = !showStockList;
            });
          },
        ),
        Expanded(
          child: showStockList ? FutureBuilder<List<Stock>>(
            future: futureStocks,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No stocks available'));
              } else {
                return StockList(stocks: snapshot.data!);
              }
            },
          ) : Container(),
        ),
      ],
    );
  }
}

class StockList extends StatelessWidget {
  final List<Stock> stocks;

  StockList({required this.stocks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: stocks.length,
      itemBuilder: (context, index) {
        final stock = stocks[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: StockInfoWidget(
            ticker: stock.ticker,
            exchange: stock.exchange,
            price: stock.price,
            change: stock.change,
            companyName: stock.companyName,
            volume: stock.volume,
            percentChange: stock.percentChange,
          ),
        );
      },
    );
  }
}

class StockInfoWidget extends StatelessWidget {
  final String ticker;
  final String exchange;
  final double price;
  final double change;
  final String companyName;
  final int volume;
  final double percentChange;

  StockInfoWidget({
    required this.ticker,
    required this.exchange,
    required this.price,
    required this.change,
    required this.companyName,
    required this.volume,
    required this.percentChange,
  });

  @override
  Widget build(BuildContext context) {
    return StockInfoCard(
      ticker: ticker,
      exchange: exchange,
      price: price,
      change: change,
      companyName: companyName,
      volume: volume,
      percentChange: percentChange,
    );
  }
}

class StockInfoCard extends StatelessWidget {
  final String ticker;
  final String exchange;
  final double price;
  final double change;
  final String companyName;
  final int volume;
  final double percentChange;

  StockInfoCard({
    required this.ticker,
    required this.exchange,
    required this.price,
    required this.change,
    required this.companyName,
    required this.volume,
    required this.percentChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$ticker | $exchange",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(height:10),
                  Text(
                    companyName,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "$price",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Text(
                    volume.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
              SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "$change",
                    style: TextStyle(
                      color: change >= 0 ? Colors.green : Colors.red,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "$percentChange%",
                    style: TextStyle(
                        color: percentChange >= 0 ? Colors.green : Colors.red,
                        fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}

class SelectionRow extends StatelessWidget {
  final VoidCallback onFirstButtonPressed;

  SelectionRow({required this.onFirstButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF019fe9), // Thay đổi từ primary thành backgroundColor
          ),
          onPressed: onFirstButtonPressed,
          child: Text('A - Z ⏑', style: TextStyle(color: Colors.white)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF28242C), // Thay đổi từ primary thành backgroundColor
          ),
          onPressed: () {
            // Hành động khi chọn nút 2
            print('Mục 2 được chọn');
          },
          child: Text('Giá', style: TextStyle(color: Colors.white)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF28242C), // Thay đổi từ primary thành backgroundColor
          ),
          onPressed: () {
            // Hành động khi chọn nút 3
            print('Mục 3 được chọn');
          },
          child: Text('Khối lượng', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
