import 'package:dio/dio.dart';

class StockService {
  final Dio _dio = Dio();

  Future<List<Stock>> fetchStocks() async {
    try {
      final response = await _dio.get('http://192.168.1.9:3000/stocks'); // URL của API

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((json) => Stock.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load stocks');
      }
    } catch (e) {
      throw Exception('Failed to load stocks: $e');
    }
  }
}

class Stock {
  final String ticker;
  final String exchange;
  final double price;
  final double change;
  final String companyName;
  final int volume;
  final double percentChange;

  Stock({
    required this.ticker,
    required this.exchange,
    required this.price,
    required this.change,
    required this.companyName,
    required this.volume,
    required this.percentChange,
  });

  factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(
      ticker: json['ticker'],
      exchange: json['exchange'],
      price: json['price'].toDouble(),
      change: json['change'].toDouble(),
      companyName: json['companyName'],
      volume: json['volume'],
      percentChange: json['percentChange'].toDouble(),
    );
  }
}
