import 'package:flutter/material.dart';

class NoMall extends StatelessWidget {
  final VoidCallback onAdd;
  NoMall({this.onAdd});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.store_mall_directory_rounded,
            color: Colors.green,
            size: 50,
          ),
          Material(
            color: Colors.orange,
            child: Text.rich(TextSpan(children: [
              TextSpan(text: "SORRY NO MALL \n\n"),
              TextSpan(text: "SORRY NO MALL")
            ])),
          ),
          SizedBox(
            height: 20,
          ),
          FlatButton(
              color: Colors.green, onPressed: onAdd, child: Text("Add malls"))
        ],
      ),
    );
  }
}
