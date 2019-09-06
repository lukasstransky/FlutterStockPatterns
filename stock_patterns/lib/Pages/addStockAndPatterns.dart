import 'package:flutter/material.dart';

class AddStockAndPatterns extends StatefulWidget {
  @override
  _AddStockAndPatternsState createState() => _AddStockAndPatternsState();
}

class _AddStockAndPatternsState extends State<AddStockAndPatterns> {
  String dropdownValue = 'AAPL';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('add Stock & Patterns'),
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: DropdownButton<String>(
            value: dropdownValue,
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: <String>['AAPL', 'TSLA', 'FB', 'GOOGL']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ));
  }
}
