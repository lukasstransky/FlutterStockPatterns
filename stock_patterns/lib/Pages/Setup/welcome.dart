import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Stock Patterns'),
       ),
       body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children: <Widget>[
           RaisedButton(
             onPressed: () {},
             child: Text('Sign in'),
           ),
           RaisedButton(
             onPressed: () {},
             child: Text('Sign up'),
           )
         ],
       ),
    );
  }
}