/// Support for doing something awesome.
///
/// More dartdocs go here.
library servermongo;

import 'package:mongo_dart/mongo_dart.dart';
import 'package:sevr/sevr.dart';

void start() async {
  //LOGIN DATABASE
  final db = await Db.create(
      'mongodb+srv://dbfarhan:888888@clusterfarhans.jciun.mongodb.net/test?retryWrites=true&w=majority');
  await db.open();
  final coll = db.collection('malls');
  // print(await coll.find().toList());

  //CREATE SERVER
  const port = 8081;
  final serv = Sevr();

  serv.get('/malls', [
    (ServRequest req, ServResponse res) async {
      final malls = await coll.find().toList();
      return res.status(200).json({'malls': malls});
    }
  ]);

  serv.post('/', [
    (ServRequest req, ServResponse res) async {
      await coll.save(req.body);
      return res.json(
        await coll.findOne(where.eq('name', req.body['name'])),
      );
    }
  ]);

  serv.delete('/:id', [
    (ServRequest req, ServResponse res) async {
      await coll
          .remove(where.eq('_id', ObjectId.fromHexString(req.params['id'])));
      return res.status(200);
    }
  ]);

  // serv.put('/:id', [
  //   (ServRequest req, ServResponse res) async{
  //     await coll.put(where.eq)
  //   }
  // ])

  //Listen Connnection
  serv.listen(port, callback: () {
    print('Server Listening on port :$port');
  });
}

// TODO: Export any libraries intended for clients of this package.
