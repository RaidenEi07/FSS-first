import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:no1/Models/Stock-item.dart';
import 'package:no1/Provider/Stock-provider.dart';
import 'package:no1/Widgets/Stock-list-title.dart';

class NewCategoryScreen extends StatefulWidget {
  @override
  _NewCategoryScreenState createState() => _NewCategoryScreenState();
}

class _NewCategoryScreenState extends State<NewCategoryScreen> {
  final TextEditingController _categoryController = TextEditingController();
  final List<StockItem> stocks = [
    StockItem(code: 'A32', exchange: 'UPCOM', companyName: 'CTCP 32'),
    StockItem(code: 'AAA', exchange: 'HOSE', companyName: 'Công ty cổ phần Nhựa An Phát Xanh'),
    StockItem(code: 'BBB', exchange: 'CCCC', companyName: 'Công ty cổ phần Bruh An Phát Xanh'),
  ];

  @override
  Widget build(BuildContext context) {
    final stockProvider = Provider.of<StockProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Thêm danh mục mới'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _categoryController,
              decoration: InputDecoration(
                labelText: 'Tên danh mục',
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: stocks.length,
                itemBuilder: (context, index) {
                  final stock = stocks[index];
                  final isSelected = stockProvider.selectedStocks.contains(stock);

                  return StockListTile(
                    stockItem: stock,
                    isSelected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          stockProvider.selectedStocks.add(stock);
                        } else {
                          stockProvider.selectedStocks.remove(stock);
                        }
                        stockProvider.notifyListeners();
                      });
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                stockProvider.changeCategory(_categoryController.text);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                backgroundColor: Colors.blue,
              ),
              child: Text('Xác nhận'),
            ),
          ],
        ),
      ),
    );
  }
}