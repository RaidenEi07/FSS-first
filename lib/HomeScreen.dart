import 'package:flutter/material.dart';
import 'CustomRow.dart';
import 'Stock.dart';
import 'SelectionRow.dart';
import 'BuildCeil.dart';
import 'CustomFooter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<StockItem> selectedStocks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BIDV Security'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
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
            const SizedBox(height: 20),
            CustomRow(
              onStocksSelected: (stocks) {
                setState(() {
                  selectedStocks = stocks;
                });
              },
            ),
            const SizedBox(height: 20),
            Container(
              color: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  children: [
                    Expanded(
                        child: buildCell('Cell 1', 'Bold Text', 'Red Text',
                            'Normal Text')),
                    const SizedBox(width: 20),
                    Expanded(
                        child: buildCell('Cell 2', 'Bold Text', 'Red Text',
                            'Normal Text')),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            SelectionRow(
              onFirstButtonPressed: () {
                print('First button pressed');
              },
            ),
            const SizedBox(height: 20),
            // Hiển thị danh sách các mục đã chọn
            Expanded(
              child: ListView.builder(
                itemCount: selectedStocks.length,
                itemBuilder: (context, index) {
                  final stock = selectedStocks[index];
                  return ListTile(
                    title: Text('${stock.code} | ${stock.exchange}'),
                    subtitle: Text(stock.companyName),
                    trailing: Icon(Icons.star, color: Colors.yellow),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomFooter(),
    );
  }
}