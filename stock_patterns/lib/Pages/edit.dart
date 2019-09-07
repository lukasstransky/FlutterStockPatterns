import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stock_patterns/Pages/home.dart';

class EditPage extends StatefulWidget {
  const EditPage({Key key, @required this.share}) : super(key: key);
  final String share;
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.share}"),
      ),
      body: Column(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: FloatingActionButton.extended(
          elevation: 4.0,
          icon: const Icon(Icons.delete),
          label: const Text('Delete'),
          backgroundColor: Colors.red,
          onPressed: deleteStockWithPatterns,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void deleteStockWithPatterns() async{
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    DocumentReference ref =
        Firestore.instance.collection('users').document(user.uid);
    ref.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        var map = datasnapshot.data['selectedSharesWithPatterns'];
        if (map == null) {
          map = {};
        }
        map.remove(widget.share);
        Firestore.instance
            .collection('users')
            .document(user.uid)
            .updateData({'selectedSharesWithPatterns': map});
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home(user: user)));
      }
    });
  }
}
