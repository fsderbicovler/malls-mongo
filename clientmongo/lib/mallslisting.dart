import 'package:clientmongo/malls.dart';
import 'package:clientmongo/nomall.dart';
import 'package:flutter/material.dart';

class MallsListing extends StatelessWidget {
  final List<Malls> malls;
  final VoidCallback onAdd;
  final Function(String id) onDelete;

  MallsListing({this.malls, this.onAdd, this.onDelete});
  @override
  Widget build(BuildContext context) {
    return malls.isEmpty
        ? NoMall(
            onAdd: onAdd,
          )
        : ListView(children: [
            ...malls
                .map<Widget>((malls) => ListTile(
                    leading: Icon(Icons.storefront_rounded),
                    title: Text(malls.name,
                        style: TextStyle(color: Colors.green, fontSize: 25)),
                    subtitle: Text(malls.area),
                    trailing: FlatButton(
                        onPressed: () {
                          onDelete(malls.name);
                        },
                        child: Icon(
                          Icons.delete_rounded,
                          size: 30,
                          color: Colors.red,
                        ))))
                .toList(),
            SizedBox(
              height: 70,
            )
          ]);
  }
}
