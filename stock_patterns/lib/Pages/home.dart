import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stock_patterns/Pages/addStockAndPatterns.dart';

class Home extends StatefulWidget {
  const Home({Key key, @required this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Home ${widget.user.email}'),
       ),
       body: Form(
         child: RaisedButton(
           onPressed: navigateToAddStockAndPatterns,
           child: Text('add Stock & Patterns'),
         ),
       ),
    );
  }

  void navigateToAddStockAndPatterns(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => AddStockAndPatterns()));
  }
}