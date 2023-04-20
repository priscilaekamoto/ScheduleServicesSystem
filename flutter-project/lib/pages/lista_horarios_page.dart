import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ItemHorario {

  final DateTime dataHora;
  final bool disponivel;

  const ItemHorario({this.dataHora, this.disponivel});

  factory ItemHorario.fromJson(Map<String, dynamic> json) {
    return ItemHorario(dataHora: DateTime.parse(json['dataHora']), disponivel: json['disponivel']);
  }
}

class ResultApi {

  final String mensagem;
  final List<ItemHorario> value;

  const ResultApi({this.mensagem, this.value});

  factory ResultApi.fromJson(Map<String, dynamic> json) {

    List<ItemHorario> listaItemHorario = List<ItemHorario>.from(json['value'].map<ItemHorario>((dynamic i) => ItemHorario.fromJson(i)));

    return ResultApi(
        mensagem: json["mensagem"],
        value: listaItemHorario
    );
  }
}

class ListaHorariosPage extends StatelessWidget {
  const ListaHorariosPage({Key key}) : super(key: key);

  @override
  void initState() {

  }

  Future<List<ItemHorario>> fetchAgenda() async {

    final response = await http
        .get(Uri.parse('https://localhost/api/Agenda?code=hehehehehe'));

    if (response.statusCode == 200) {

      ResultApi resultApi = await ResultApi.fromJson(jsonDecode(response.body));
      return resultApi.value;
    } else {
      throw Exception('Failed to load album');
    }
  }

  showAlertDialog(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("Agendar"),
      onPressed: () =>
      {Navigator.of(context).pushReplacementNamed('/agendamentos')},
    );
    Widget cancelarButton = FlatButton(
      child: Text("Cancelar"),
      onPressed: () =>
      {
        Navigator.pop(context, false)
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Text("Deseja agendar o atendimento para 11:00?"),
      actions: [okButton, cancelarButton],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String _selectedValue;

    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          //color: Colors.red,
          padding: EdgeInsets.symmetric(vertical: 70.0, horizontal: 70.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.asset("assets/logo_assinatura.png", width: 250),
                FutureBuilder(
                  future:fetchAgenda(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return snapshot.hasData
                        ? Container(
                      child: DropdownButton<String>(
                        hint: Text("Selecione um Horário" ?? 'Make a selection'),
                        items: snapshot.data.map<DropdownMenuItem<String>>((item) {

                          return DropdownMenuItem<String>(
                            value: 12.toString(), // TODO: Trocar pelo id do serviço
                            child: Text(DateFormat('dd/MM/yyyy – kk:mm').format(item.dataHora)),
                          );
                        }).toList(),
                        onChanged: (value) {
                          _selectedValue = value.toString();
                          showAlertDialog(context);
                        },
                      ),
                    )
                        : Container(
                      child: Center(
                        child: Text('Buscando Agenda...'),
                      ),
                    );
                  },
                ),
                SizedBox(height: 290),
                ButtonTheme(
                  height: 60.0,
                  minWidth: 250.0,
                  child: RaisedButton(
                    onPressed: () => {
                      Navigator.of(context).pushReplacementNamed('/servicos')
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    child: Text("VOLTAR",
                        style: TextStyle(color: Colors.white70, fontSize: 15)),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

