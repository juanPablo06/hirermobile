import 'package:hirermobile/database/app_database.dart';
import 'package:hirermobile/models/curriculo.dart';
import 'package:sqflite/sqflite.dart';

class CurriculoDao {
  static const String tableSql = 'CREATE TABLE $_tableName ('
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
      ')';
  static const String _tableName = 'curriculos';

  Future<int> save(Curriculo curriculo) async {
    final Database db = await getDatabase();

    Map<String, dynamic> curriculoMap = _toMap(curriculo);
    return db.insert(_tableName, curriculoMap);
  }

  Map<String, dynamic> _toMap(Curriculo curriculo) {
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
    return curriculoMap;
  }

  Future<List<Curriculo>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    final List<Curriculo> curriculos = [];

    for (Map<String, dynamic> row in result) {
      final Curriculo curriculo = Curriculo(
          row['id'],
          row['name'],
          row['description'],
          row['age'],
          row['nationality'],
          row['email'],
          row['telephone'],
          row['adress'],
          row['professionalObjectives'],
          row['skills'],
          row['certifications'],
          row['languages']);
      curriculos.add(curriculo);
    }
    return curriculos;
  }
}
