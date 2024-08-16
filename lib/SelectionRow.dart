import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectionRow extends StatelessWidget {
  final VoidCallback onFirstButtonPressed;

  SelectionRow({required this.onFirstButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Consumer<SelectionRowModel>(
      builder: (context, model, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: model.selectedOption == 'A-Z'
                    ? Color(0xFF019fe9)
                    : Color(0xFF28242C),
              ),
              onPressed: () {
                onFirstButtonPressed();
                model.selectOption('A-Z');
              },
              child: Text('A - Z ⏑', style: TextStyle(color: Colors.white)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: model.selectedOption == 'Giá'
                    ? Color(0xFF019fe9)
                    : Color(0xFF28242C),
              ),
              onPressed: () {
                print('Mục 2 được chọn');
                model.selectOption('Giá');
              },
              child: Text('Giá', style: TextStyle(color: Colors.white)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: model.selectedOption == 'Khối lượng'
                    ? Color(0xFF019fe9)
                    : Color(0xFF28242C),
              ),
              onPressed: () {
                print('Mục 3 được chọn');
                model.selectOption('Khối lượng');
              },
              child: Text('Khối lượng', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}

class SelectionRowModel with ChangeNotifier {
  String _selectedOption = 'A-Z';

  String get selectedOption => _selectedOption;

  void selectOption(String option) {
    _selectedOption = option;
    notifyListeners();
  }
}