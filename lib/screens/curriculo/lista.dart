import 'package:flutter/material.dart';
import 'package:hirermobile/models/curriculo.dart';
import 'package:hirermobile/screens/curriculo/form.dart';

class ListaCurriculos extends StatefulWidget {
  final List<Curriculo?> _curriculos = [];

  @override
  State<StatefulWidget> createState() {
    return ListaCurriculosState();
  }
}

class ListaCurriculosState extends State<ListaCurriculos> {
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
            child: ListView.builder(
              itemCount: widget._curriculos.length,
              itemBuilder: (context, index) {
                final curriculo = widget._curriculos[index];
                return ItemCurriculo(curriculo!);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Curriculo?> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormCurriculos();
          }));
          future.then((curriculoRecebido) {
            if (curriculoRecebido != null) {
              setState(() {
                widget._curriculos.add(curriculoRecebido);
              });
            }
          });
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
