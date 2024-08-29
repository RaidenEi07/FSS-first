import 'package:flutter/material.dart';

class SelectionRow extends StatefulWidget {
  final VoidCallback onFirstButtonPressed;

  const SelectionRow({Key? key, required this.onFirstButtonPressed}) : super(key: key);

  @override
  _SelectionRowState createState() => _SelectionRowState();
}

class _SelectionRowState extends State<SelectionRow> {
  String _selectedOption = 'A-Z';

  void _selectOption(String option) {
    setState(() {
      _selectedOption = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: _selectedOption == 'A-Z' ? Color(0xFF019fe9) : Color(0xFF28242C),
          ),
          onPressed: () {
            widget.onFirstButtonPressed();
            _selectOption('A-Z');
          },
          child: Text('A - Z ⏑', style: TextStyle(color: Colors.white)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: _selectedOption == 'Giá' ? Color(0xFF019fe9) : Color(0xFF28242C),
          ),
          onPressed: () {
            print('Mục 2 được chọn');
            _selectOption('Giá');
          },
          child: Text('Giá', style: TextStyle(color: Colors.white)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: _selectedOption == 'Khối lượng' ? Color(0xFF019fe9) : Color(0xFF28242C),
          ),
          onPressed: () {
            print('Mục 3 được chọn');
            _selectOption('Khối lượng');
          },
          child: Text('Khối lượng', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}