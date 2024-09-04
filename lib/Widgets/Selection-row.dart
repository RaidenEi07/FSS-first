import 'package:flutter/material.dart';
import 'package:no1/Models/Stock-item.dart';

class SelectionRow extends StatelessWidget {
  final VoidCallback onFirstButtonPressed;
  final List<StockItem> selectedStocks;
  final String? currentCategory;

  const SelectionRow({
    Key? key,
    required this.onFirstButtonPressed,
    required this.selectedStocks,
    required this.currentCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: onFirstButtonPressed,
              child: Text('A - Z ⏑', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          currentCategory ?? 'Chưa có danh mục',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        const SizedBox(height: 10),
        for (var stock in selectedStocks)
          Text(
            '${stock.code} | ${stock.exchange}',
            style: TextStyle(color: Colors.white),
          ),
      ],
    );
  }
}

