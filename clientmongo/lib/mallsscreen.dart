import 'package:clientmongo/api.dart';
import 'package:clientmongo/malls.dart';
import 'package:clientmongo/mallslisting.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class MallsScreen extends StatefulWidget {
  MallsScreen({Key key, this.title}) : super(key: key);

  final String title;
  final MallsApi api = MallsApi();

  @override
  _MallsScreenState createState() => _MallsScreenState();
}

class _MallsScreenState extends State<MallsScreen> {
  List<Malls> malls = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    widget.api.getMalls().then((data) {
      setState(() {
        malls = data;
        loading = false;
      });
    });
  }

  void _addmalls() async {
    final faker = Faker();
    final name = faker.company;
    final mallname = 'Mall ${name.name()}';
    final address = faker.address;
    final malladdrs = '${address.city()}';

    final createmalls = await widget.api.createMalls(mallname, malladdrs);
    setState(() {
      malls.add(createmalls);
    });
  }

  void _deletemall(String id) {
    setState(() {
      malls.removeWhere((malls) => malls.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : MallsListing(
                malls: malls,
                onAdd: _addmalls,
                onDelete: _deletemall,
              ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.green,
              tooltip: 'refresh Malls',
              child: Icon(Icons.refresh_rounded),
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              onPressed: _addmalls,
              tooltip: 'Add new malls',
              child: Icon(Icons.add_business_rounded),
            ),
          ],
        ));
  }
}
