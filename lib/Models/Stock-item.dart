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