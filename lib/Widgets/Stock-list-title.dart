import 'package:flutter/material.dart';
import 'package:no1/Models/Stock-item.dart';

class StockListTile extends StatelessWidget {
  final StockItem stockItem;
  final bool isSelected;
  final Function(bool) onSelected;

  StockListTile({
    required this.stockItem,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${stockItem.code} | ${stockItem.exchange}'),
      subtitle: Text(stockItem.companyName),
      trailing: Icon(
        isSelected ? Icons.star : Icons.star_border,
        color: isSelected ? Colors.yellow : null,
      ),
      onTap: () {
        onSelected(!isSelected);
      },
    );
  }
}