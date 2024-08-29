import 'package:flutter/material.dart';
import 'Stock.dart';
import 'NewScreen.dart';

class CustomRow extends StatefulWidget {
  final void Function(List<StockItem>) onStocksSelected;

  CustomRow({required this.onStocksSelected});

  @override
  _CustomRowState createState() => _CustomRowState();
}

class _CustomRowState extends State<CustomRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(
            onPressed: () async {
              final selected = await Navigator.push<List<StockItem>>(
                context,
                MaterialPageRoute(
                  builder: (context) => NewCategoryScreen(),
                ),
              );

              if (selected != null) {
                widget.onStocksSelected(selected);
              }
            },
            icon: const Icon(Icons.add, color: Colors.white),
          ),
        ),
        const SizedBox(width: 20),
        DropdownButtonHideUnderline(
          child: Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButton<String>(
              hint: const Text('Chưa có danh mục',
                  style: TextStyle(color: Colors.white)),
              dropdownColor: Colors.black,
              items: <String>['Mục 1', 'Mục 2', 'Mục 3']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Xử lý khi chọn mục 1
              },
            ),
          ),
        ),
        const SizedBox(width: 20),
        Container(
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: DropdownButton<String>(
              hint: const Text('VNINDEX',
                  style: TextStyle(color: Colors.white)),
              dropdownColor: Colors.black,
              items: <String>['Mục A', 'Mục B', 'Mục C']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Xử lý khi chọn mục 2
              },
            ),
          ),
        ),
      ],
    );
  }
}