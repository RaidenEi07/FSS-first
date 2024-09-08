import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:no1/Models/Stock-item.dart';
import 'package:no1/Provider/Stock-provider.dart';
import 'package:no1/Widgets//Custom-row.dart';
import 'package:no1/Widgets//Selection-row.dart';
import 'package:no1/Widgets//Custom-footer.dart';
import 'package:no1/Provider/Socket-provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<StockItem> selectedStocks = [];
  String? currentCategory;

  @override
  void initState() {
    super.initState();
    // Connect to the socket
    Provider.of<SocketProvider>(context, listen: false).connect();
  }

  @override
  void dispose() {
    // Disconnect from the socket when the screen is disposed
    Provider.of<SocketProvider>(context, listen: false).disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final stockProvider = Provider.of<StockProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('BIDV Security'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // Handle refresh
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
              onStocksSelected: stockProvider.selectStocks,
              onCategoryChanged: stockProvider.changeCategory,
              onClearStocks: stockProvider.clearStocks,
            ),
            const SizedBox(height: 20),
            SelectionRow(
              onFirstButtonPressed: () {
                print('First button pressed');
              },
              selectedStocks: stockProvider.selectedStocks,
              currentCategory: stockProvider.currentCategory,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: stockProvider.selectedStocks.length,
                itemBuilder: (context, index) {
                  final stock = stockProvider.selectedStocks[index];
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