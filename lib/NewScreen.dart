import 'package:flutter/material.dart';
import 'Stock.dart';

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
    // Thêm các StockItem khác tại đây
  ];
  final List<StockItem> selectedStocks = [];

  @override
  Widget build(BuildContext context) {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, selectedStocks);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      backgroundColor: Colors.blue,
                    ),
                    child: Text('Xác nhận'),
                  ),
                ),
                SizedBox(width: 8.0),
                CircleAvatar(
                  radius: 20.0,
                  backgroundImage: AssetImage('assets/avatar.png'),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                hintText: 'Tìm kiếm',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: stocks.length,
                itemBuilder: (context, index) {
                  return StockListTile(
                    stockItem: stocks[index],
                    isSelected: selectedStocks.contains(stocks[index]),
                    onSelected: (isSelected) {
                      setState(() {
                        if (isSelected) {
                          selectedStocks.add(stocks[index]);
                        } else {
                          selectedStocks.remove(stocks[index]);
                        }
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}