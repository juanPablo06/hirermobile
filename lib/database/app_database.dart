import 'package:hirermobile/database/dao/curriculo_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'hirer.db');

  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(CurriculoDao.tableSql);
    },
    version: 1,
    /*onDowngrade: onDatabaseDowngradeDelete,*/
  );
}
