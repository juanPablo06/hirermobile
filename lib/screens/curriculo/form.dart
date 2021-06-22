import 'package:flutter/material.dart';
import 'package:hirermobile/components/editor.dart';
import 'package:hirermobile/models/curriculo.dart';

class FormCurriculos extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormCurriculoState();
  }
}

class FormCurriculoState extends State<FormCurriculos> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerAge = TextEditingController();
  final TextEditingController _controllerNationality = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerAdress = TextEditingController();
  final TextEditingController _controllerDescription = TextEditingController();
  final TextEditingController _controllerProfessionalObjectives =
      TextEditingController();
  final TextEditingController _controllerSkills = TextEditingController();
  final TextEditingController _controllerCertifications =
      TextEditingController();
  final TextEditingController _controllerLanguages = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Currículo'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
                controller: _controllerName,
                hint: 'Alfredo Marques de Azevedo',
                label: 'Seu nome completo'),
            Editor(controller: _controllerAge, hint: '20 anos', label: 'Idade'),
            Editor(
                controller: _controllerNationality,
                hint: 'Brasileiro',
                label: 'Nacionalidade'),
            Editor(
                controller: _controllerEmail,
                hint: 'seuemail@gmail.com',
                label: 'E-mail'),
            Editor(
                controller: _controllerPhone,
                hint: '(XX)XXXXX-XXXX',
                label: 'Celular'),
            Editor(
                controller: _controllerAdress,
                hint: 'Diga sua rua, bairro, cidade e estado',
                label: 'Endereço'),
            Editor(
                controller: _controllerDescription,
                hint: 'Conte um pouco sobre você',
                label: 'Descrição'),
            Editor(
                controller: _controllerProfessionalObjectives,
                hint: 'Fale sobre seus objetivos',
                label: 'Objetivos Profissionais'),
            Editor(
                controller: _controllerSkills,
                hint: 'Conte sobre suas habilidades!',
                label: 'Habilidades'),
            Editor(
                controller: _controllerCertifications,
                hint: 'Quais certificações você possui?',
                label: 'Certificações'),
            Editor(
                controller: _controllerLanguages,
                hint: 'Quais seus idiomas falados',
                label: 'Idiomas'),
            ElevatedButton(
              child: Text('Enviar'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red[800],
                padding: EdgeInsets.fromLTRB(24, 8, 24, 8),
                elevation: 16,
                textStyle: TextStyle(fontSize: 16),
              ),
              onPressed: () => _criaCurriculo(context),
            )
          ],
        ),
      ),
    );
  }

  void _criaCurriculo(BuildContext context) {
    final String name = _controllerName.text;
    final String description = _controllerDescription.text;
    final String nationality = _controllerNationality.text;
    final String age = _controllerAge.text;
    final String email = _controllerEmail.text;
    final String telephone = _controllerPhone.text;
    final String adress = _controllerAdress.text;
    final String professionalObjectives =
        _controllerProfessionalObjectives.text;
    final String skills = _controllerSkills.text;
    final String certifications = _controllerCertifications.text;
    final String languages = _controllerLanguages.text;

    final curriculoCriado = Curriculo(
        0,
        name,
        description,
        age,
        nationality,
        email,
        telephone,
        adress,
        professionalObjectives,
        skills,
        certifications,
        languages);
    Navigator.pop(context, curriculoCriado);
  }
}
