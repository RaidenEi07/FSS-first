import 'package:flutter/material.dart';
import 'stock_service.dart';
import 'SelectionRow.dart';

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