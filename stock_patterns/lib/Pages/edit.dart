import 'package:flutter/material.dart';

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
       body: Column(
         
       ),
       floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: FloatingActionButton.extended(
          elevation: 4.0,
          icon: const Icon(Icons.delete),
          label: const Text('Delete'),
          backgroundColor: Colors.red,
          onPressed: (){},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}