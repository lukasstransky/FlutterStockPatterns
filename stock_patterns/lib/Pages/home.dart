import 'package:cloud_firestore/cloud_firestore.dart';
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
  /*Widget _buildList(BuildContext context,  ) {
    /*return Row(
      children: <Widget>[
        Text(document[''])
      ],
    )*/
    print("*****************************");
    print(document);
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home ${widget.user.email}'),
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: navigateToAddStockAndPatterns,
              child: Text('add Stock & Patterns'),
            ),
            Expanded(
              child: StreamBuilder(
                stream: Firestore.instance.collection('users').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Text("Loading...");
                  }
                  Map map =
                      snapshot.data.documents[0]['selectedSharesWithPatterns'];
                  return ListView.builder(
                    itemExtent: 80.0,
                    itemCount: map.length,
                    itemBuilder: (context, index) {
                      String share = map.keys.elementAt(index).toString();
                      String amountOfPatterns =
                          map.values.elementAt(index).length.toString();
                      return Row(
                        children: <Widget>[
                          Text("$share $amountOfPatterns Muster")
                        ],
                      );
                    },
                  );
                },
              ),
            )
          ],
        ));
  }

  void navigateToAddStockAndPatterns() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => AddStockAndPatterns()));
  }
}
