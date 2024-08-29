import 'package:flutter/material.dart';

class StockItem {
  final String code;
  final String exchange;
  final String companyName;

  StockItem({
    required this.code,
    required this.exchange,
    required this.companyName,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is StockItem &&
              runtimeType == other.runtimeType &&
              code == other.code &&
              exchange == other.exchange &&
              companyName == other.companyName;

  @override
  int get hashCode => code.hashCode ^ exchange.hashCode ^ companyName.hashCode;
}

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
