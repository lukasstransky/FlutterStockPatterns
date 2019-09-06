import 'package:flutter/material.dart';

class AddStockAndPatterns extends StatefulWidget {
  @override
  _AddStockAndPatternsState createState() => _AddStockAndPatternsState();
}

class _AddStockAndPatternsState extends State<AddStockAndPatterns> {
  String dropdownValue = 'AAPL';
  Map<String, bool> values = {
    'Muster 1': false,
    'Muster 2': false,
    'Muster 3': false
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('add Stock & Patterns'),
        ),
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                DropdownButton<String>(
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
                )
              ],
            ),
            Column(
              children: values.keys.map((String key) {
                return new CheckboxListTile(
                  title: new Text(key),
                  value: values[key],
                  onChanged: (bool value) {
                    setState(() {
                      values[key] = value;
                    });
                  },
                );
              }).toList(),
            )
          ],
        ));
  }
}
