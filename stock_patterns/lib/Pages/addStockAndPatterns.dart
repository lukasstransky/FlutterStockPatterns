import 'package:flutter/material.dart';

class AddStockAndPatterns extends StatefulWidget {
  @override
  _AddStockAndPatternsState createState() => _AddStockAndPatternsState();
}

class _AddStockAndPatternsState extends State<AddStockAndPatterns> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('add Stock & Patterns'),
       ),
    );
  }
}