import 'package:flutter/material.dart';

class SelectionRow extends StatelessWidget {
  final VoidCallback onFirstButtonPressed;

  SelectionRow({required this.onFirstButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF019fe9), // Thay đổi từ primary thành backgroundColor
          ),
          onPressed: onFirstButtonPressed,
          child: Text('A - Z ⏑', style: TextStyle(color: Colors.white)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF28242C), // Thay đổi từ primary thành backgroundColor
          ),
          onPressed: () {
            // Hành động khi chọn nút 2
            print('Mục 2 được chọn');
          },
          child: Text('Giá', style: TextStyle(color: Colors.white)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF28242C), // Thay đổi từ primary thành backgroundColor
          ),
          onPressed: () {
            // Hành động khi chọn nút 3
            print('Mục 3 được chọn');
          },
          child: Text('Khối lượng', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}