import 'package:flutter/material.dart';
import 'package:no1/Models/Stock-item.dart';
import 'package:no1/Display/New-Screen-Category.dart';

class CustomRow extends StatefulWidget {
  final void Function(List<StockItem>) onStocksSelected;
  final void Function(String?) onCategoryChanged;
  final VoidCallback onClearStocks;

  CustomRow({
    required this.onStocksSelected,
    required this.onCategoryChanged,
    required this.onClearStocks,
  });

  @override
  _CustomRowState createState() => _CustomRowState();
}

class _CustomRowState extends State<CustomRow> {
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Thêm danh mục'),
                onTap: () async {
                  Navigator.pop(context);
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
              ),
              // Check if there is a current category
              ListTile(
                title: const Text('Xóa danh mục hiện tại'),
                onTap: () {
                  // Clear the selected stocks
                  widget.onClearStocks();
                  widget.onCategoryChanged(null); // Clear the current category
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

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
            onPressed: () {
              _showBottomSheet(context);
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
                // Handle selection
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
                // Handle selection
              },
            ),
          ),
        ),
      ],
    );
  }
}