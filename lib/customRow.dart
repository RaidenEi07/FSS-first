import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 2), // Viền màu xanh
            borderRadius: BorderRadius.circular(8), // Bo góc (tùy chọn)
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.add, color: Colors.white),
          ),
        ),
        SizedBox(width: 20),
        DropdownButtonHideUnderline(
          child: Container(
            height: 40,
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButton<String>(
              hint: Text('Chưa có danh mục', style: TextStyle(color: Colors.white)),
              dropdownColor: Colors.black,
              items: <String>['Mục 1', 'Mục 2', 'Mục 3'].map((String value) {
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

        SizedBox(width: 20),
        Container(
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding (
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child:DropdownButton<String>(
              hint: Text('VNINDEX', style: TextStyle(color: Colors.white)),
              dropdownColor: Colors.black,
              items: <String>['Mục A', 'Mục B', 'Mục C'].map((String value) {
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