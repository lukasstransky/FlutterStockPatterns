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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home ${widget.user.email}'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder(
              stream: Firestore.instance.collection('users').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Text("Loading...");
                }
                Map map =
                    snapshot.data.documents[0]['selectedSharesWithPatterns'];
                return Container(
                  margin:
                      const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
                  child: ListView.builder(
                    itemCount: map.length,
                    itemBuilder: (context, index) {
                      String share = map.keys.elementAt(index).toString();
                      String amountOfPatterns =
                          map.values.elementAt(index).length.toString();
                      return Container(
                        height: 50,
                        child: Card(
                            color: Colors.blue[100],
                            elevation: 5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 90,
                                      child: Text(
                                        "$share",
                                        style: TextStyle(fontSize: 20.0),
                                      ),
                                    ),
                                    Text("$amountOfPatterns Muster"),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(Icons.edit),
                                      tooltip: 'add/delete patterns',
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      tooltip: 'delete share with patterns',
                                      onPressed: () {},
                                    )
                                  ],
                                )
                              ],
                            )),
                      );
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: FloatingActionButton.extended(
          elevation: 4.0,
          icon: const Icon(Icons.add),
          label: const Text('Add Stock With Patterns'),
          onPressed: () {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void navigateToAddStockAndPatterns() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => AddStockAndPatterns()));
  }
}
