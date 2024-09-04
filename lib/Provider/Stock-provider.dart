import 'package:flutter/material.dart';
import 'package:no1/Models/Stock-item.dart';

class StockProvider extends ChangeNotifier {
  List<StockItem> _selectedStocks = [];
  String? _currentCategory;

  List<StockItem> get selectedStocks => _selectedStocks;
  String? get currentCategory => _currentCategory;

  void selectStocks(List<StockItem> stocks) {
    _selectedStocks = stocks;
    notifyListeners();
  }

  void changeCategory(String? category) {
    _currentCategory = category;
    notifyListeners();
  }

  void clearStocks() {
    _selectedStocks.clear();
    notifyListeners();
  }
}