import 'package:flutter/material.dart';
import 'package:stock_patterns/Pages/Setup/signIn.dart';
import 'package:stock_patterns/Pages/Setup/signUp.dart';

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
             onPressed: navigateToSignIn,
             child: Text('Sign in'),
           ),
           RaisedButton(
             onPressed: navigateToSignUp,
             child: Text('Sign up'),
           )
         ],
       ),
    );
  }

  void navigateToSignIn(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(), fullscreenDialog: true));
  }

  void navigateToSignUp(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(), fullscreenDialog: true));
  }

}