import 'dart:async';

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
  Map<String, bool> patternsValues = {
    'Muster 1': false,
    'Muster 2': false,
    'Muster 3': false
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.share}"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: StreamBuilder(
              stream: Firestore.instance.collection('users').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Text("Loading...");
                }
                Map map =
                    snapshot.data.documents[0]['selectedSharesWithPatterns'];
                List patterns;
                if (map != null) {
                  patterns = map[widget.share].toList();
                  for (int i = 0; i < patterns.length; i++) {
                    if (patternsValues.containsKey(patterns[i])) {
                      patternsValues[patterns[i]] = true;
                    }
                  }
                }
                return Column(
                  children: patternsValues.keys.map((String key) {
                    return new CheckboxListTile(
                      title: new Text(key),
                      value: patternsValues[key],
                      onChanged: (bool value) {
                        setState(() {
                          List patterns = map[widget.share].toList();
                          if(value == true){
                            patterns.add(key);
                          }else{
                            patterns.remove(key);
                          }
                          map[widget.share] = patterns;
                          Firestore.instance
                              .collection('users')
                              .document('5J1ITudmcoNrKPWnARFZUBmP68z2')
                              .updateData({'selectedSharesWithPatterns': map});
                          patternsValues[key] = value;
                        });
                      },
                    );
                  }).toList(),
                );
              },
            ),
          ),
          RaisedButton(
            child: Text("Update"),
            onPressed: updatePatterns,
          )
        ],
      ),
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

  void deleteStockWithPatterns() async {
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

  /*Future<Map> getMapFromFirestore() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    DocumentReference ref =
        Firestore.instance.collection('users').document(user.uid);
    Map result;
    await ref.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        var map = datasnapshot.data['selectedSharesWithPatterns'];
        if (map == null) {
          map = {};
        }
        result = map;
      }
    });
    return result;
  }*/

  void updatePatterns() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    /*Firestore.instance
      .collection('users')
      .document(user.uid)
      .updateData({'selectedSharesWithPatterns': map});*/
    print("****************");
    print(patternsValues);
  }

  /*Future<void> updatePatterns() async {
    await getMapFromFirestore().then((result) {
      map = result;
      List patterns = map[widget.share];
      for (int i = 0; i < patterns.length; i++) {
        if (patternsValues.containsKey(patterns[i])) {
          patternsValues[patterns[i]] = true;
        }
      }
      print(patternsValues);
    });
    print("finished 1");
  }*/
}
