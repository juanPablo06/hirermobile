import 'package:flutter/material.dart';
import 'package:hirermobile/database/dao/curriculo_dao.dart';
import 'package:hirermobile/models/curriculo.dart';
import 'package:hirermobile/screens/curriculo/form.dart';

class ListaCurriculos extends StatefulWidget {
  @override
  _ListaCurriculosState createState() => _ListaCurriculosState();
}

class _ListaCurriculosState extends State<ListaCurriculos> {
  final CurriculoDao _dao = CurriculoDao();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Base de Currículos',
          style: TextStyle(fontFamily: 'Staatliches', letterSpacing: 1.5),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Image.asset(
            'assets/images/hirer-logo.png',
            fit: BoxFit.contain,
            width: 200,
            height: 100,
            alignment: Alignment.center,
          ),
          Text(
            'Bem vindo(a) à base de currículos Hirer.',
            style: TextStyle(fontSize: 16),
          ),
          Expanded(
            child: FutureBuilder<List<Curriculo>>(
              initialData: [],
              future: _dao.findAll(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    // TODO: Handle this case.
                    break;
                  case ConnectionState.waiting:
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          Text('Loading')
                        ],
                      ),
                    );
                    break;
                  case ConnectionState.active:
                    // TODO: Handle this case.
                    break;
                  case ConnectionState.done:
                    final List<Curriculo> _curriculos = snapshot.data;
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: _curriculos.length,
                      itemBuilder: (context, index) {
                        final Curriculo? curriculo = _curriculos[index];
                        return ItemCurriculo(curriculo!);
                      },
                    );
                }
                return Text('Unknown error');
              },
            ),
          ),
          Divider(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(
                builder: (context) => FormCurriculos(),
              ))
              .then((value) => setState(() {}));
        },
      ),
    );
  }
}

class ItemCurriculo extends StatelessWidget {
  final Curriculo _curriculo;

  ItemCurriculo(this._curriculo);

  @override
  Widget build(BuildContext context) {
    var text = Text(
      '${_curriculo.description}',
      style: TextStyle(fontSize: 16),
      overflow: TextOverflow.clip,
    );
    return Container(
      height: 400,
      margin: EdgeInsets.fromLTRB(0, 24, 0, 0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(
                Icons.work_outline_outlined,
                color: Colors.redAccent,
              ),
              title: Text(
                '${_curriculo.name} | ${_curriculo.skills}',
                style: TextStyle(fontWeight: FontWeight.w700),
                overflow: TextOverflow.clip,
              ),
              subtitle: text,
            ),
            Divider(
              color: Colors.black,
              thickness: 2,
            ),
            Text(
              'Endereço: ${_curriculo.adress}',
              overflow: TextOverflow.clip,
              textAlign: TextAlign.right,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            _elementsDivider(),
            Text(
              'Nacionalidade: ${_curriculo.nationality}',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.w600),
              overflow: TextOverflow.clip,
            ),
            _elementsDivider(),
            Text(
              'Idade: ${_curriculo.age}',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.w600),
              overflow: TextOverflow.clip,
            ),
            _elementsDivider(),
            Text(
              'Contatos: ${_curriculo.email} | ${_curriculo.telephone}',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.w600),
              overflow: TextOverflow.clip,
            ),
            _elementsDivider(),
            Text(
              'Certificações: ${_curriculo.certifications}',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.w600),
              overflow: TextOverflow.clip,
            ),
            _elementsDivider(),
            Text(
              'Idiomas: ${_curriculo.languages}',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.w600),
              overflow: TextOverflow.clip,
            ),
          ],
        ),
      ),
    );
  }
}

class _elementsDivider extends StatelessWidget {
  const _elementsDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.black,
      thickness: 0.2,
    );
  }
}
