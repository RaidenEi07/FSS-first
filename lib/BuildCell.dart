import 'package:flutter/material.dart';

Widget buildCell(String cellName, String boldText, String redText, String normalText) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 8.0),
    decoration: BoxDecoration(
      color: Colors.white12,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child:
          Text(
            cellName,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                boldText,
                style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
              ),
              SizedBox(width: 8),
              Text(
                redText,
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text(normalText, style: TextStyle(color: Colors.white)),
        ),
      ],
    ),
  );
}