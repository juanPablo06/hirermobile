import 'package:hirermobile/models/curriculo.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'hirer.db');
    return openDatabase(
      path,
      onCreate: (db, version) {
        db.execute(
          'CREATE TABLE curriculos ('
          'id INTEGER PRIMARY KEY, '
          'name TEXT, '
          'description TEXT, '
          'age TEXT, '
          'nationality TEXT, '
          'adress TEXT, '
          'email TEXT, '
          'telephone TEXT, '
          'skills TEXT, '
          'professionalObjectives TEXT, '
          'languages TEXT, '
          'certifications TEXT'
          ')',
        );
      },
      version: 1,
      /*
      onDowngrade: onDatabaseDowngradeDelete,
      */
    );
  });
}

Future<int> save(Curriculo curriculo) {
  return createDatabase().then((db) {
    final Map<String, dynamic> curriculoMap = Map();
    curriculoMap['name'] = curriculo.name;
    curriculoMap['description'] = curriculo.description;
    curriculoMap['age'] = curriculo.age;
    curriculoMap['nationality'] = curriculo.nationality;
    curriculoMap['email'] = curriculo.email;
    curriculoMap['telephone'] = curriculo.telephone;
    curriculoMap['adress'] = curriculo.adress;
    curriculoMap['professionalObjectives'] = curriculo.professionalObjectives;
    curriculoMap['skills'] = curriculo.skills;
    curriculoMap['certifications'] = curriculo.certifications;
    curriculoMap['languages'] = curriculo.languages;
    return db.insert('curriculos', curriculoMap);
  });
}

Future<List<Curriculo>> findAll() {
  return createDatabase().then((db) {
    return db.query('curriculos').then((maps) {
      final List<Curriculo> curriculos = [];
      for (Map<String, dynamic> map in maps) {
        final Curriculo curriculo = Curriculo(
            map['id'],
            map['name'],
            map['description'],
            map['age'],
            map['nationality'],
            map['email'],
            map['telephone'],
            map['adress'],
            map['professionalObjectives'],
            map['skills'],
            map['certifications'],
            map['languages']);
        curriculos.add(curriculo);
      }
      return curriculos;
    });
  });
}
