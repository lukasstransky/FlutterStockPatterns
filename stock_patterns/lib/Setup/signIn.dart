import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage>{

  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
      ),
      body: Form(
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (input) { //TODO: check if email is correct
                if(input.isEmpty) {
                  return 'Please type an email';
                }
              },
              onSaved: (input) => _email = input,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              validator: (input) { //TODO: check if password is strong enough (if needed)
                if(input.length < 6) {
                  return 'Your Password needs to be atleast 6 characters';
                }
              },
              onSaved: (input) => _password = input,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            RaisedButton(
              onPressed: () {},
              child: Text('Sign in'),
            )
          ],
        ),
      ),
    );
  }

  void signIn(){
    final formState = _formKey.currentState;
    if(formState.validate() == true) {}
  }
}