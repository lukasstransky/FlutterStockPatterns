import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddStockAndPatterns extends StatefulWidget {
  @override
  _AddStockAndPatternsState createState() => _AddStockAndPatternsState();
}

class _AddStockAndPatternsState extends State<AddStockAndPatterns> {
  String dropdownValue = 'AAPL';
  Map<String, bool> patternsValues = {
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
            children: patternsValues.keys.map((String key) {
              return new CheckboxListTile(
                title: new Text(key),
                value: patternsValues[key],
                onChanged: (bool value) {
                  setState(() {
                    patternsValues[key] = value;
                  });
                },
              );
            }).toList(),
          )
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: FloatingActionButton.extended(
          elevation: 4.0,
          icon: const Icon(Icons.add),
          label: const Text('Add Stock With Patterns'),
          onPressed: savePatterns,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void savePatterns() async{
    //print(selectedPatterns.values);
    List<String> selectedPatterns = [];
    for(int i = 0; i < patternsValues.values.length; i++){
      if(patternsValues.values.elementAt(i) == true){
        selectedPatterns.add(patternsValues.keys.elementAt(i));
      }
    }
    //print(selectedPatterns);
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    Firestore.instance.collection('users').document(user.uid).updateData({
      'selectedPatterns': selectedPatterns
    });
  }

}
