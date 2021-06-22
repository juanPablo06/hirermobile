import 'package:flutter/material.dart';
import 'package:hirermobile/database/app_database.dart';
import 'package:hirermobile/models/curriculo.dart';
import 'package:hirermobile/screens/curriculo/form.dart';

class ListaCurriculos extends StatefulWidget {
  @override
  _ListaCurriculosState createState() => _ListaCurriculosState();
}

class _ListaCurriculosState extends State<ListaCurriculos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Base de Currículos'),
        centerTitle: true,
      ),
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
              future: findAll(),
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
    return Card(
        child: ListTile(
      leading: Icon(Icons.work),
      title: Text(_curriculo.name),
      subtitle: Text(_curriculo.description),
    ));
  }
}
