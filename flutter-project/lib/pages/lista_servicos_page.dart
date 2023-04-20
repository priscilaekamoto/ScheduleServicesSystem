import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;

class ItemServico {

  final String nome;
  final double tempo;
  final double valor;

  const ItemServico({this.nome, this.tempo, this.valor});

  factory ItemServico.fromJson(Map<String, dynamic> json) {

    return ItemServico(
        nome: json['nome'],
        tempo: json['tempo'],
        valor: json['valor']
    );
  }
}

class ResultApi {

  final String mensagem;
  final List<ItemServico> value;

  const ResultApi({this.mensagem, this.value});

  factory ResultApi.fromJson(Map<String, dynamic> json) {

    List<ItemServico> listaServicos = List<ItemServico>.from(json['value'].map<ItemServico>((dynamic i) => ItemServico.fromJson(i)));

    return ResultApi(
      mensagem: json['mensagem'],
      value: listaServicos
    );
  }
}

class ListaServicosPage extends StatelessWidget {

  const ListaServicosPage({Key key}) : super(key: key);

  @override
  void initState() {

  }

  Future<List<ItemServico>> fetchService() async {

    /*
    listaServicosGlobal = new List<ItemServico>();
    var itemservico = new ItemServico(nome: "Unha", tempo:01.3, valor:150.50);
    var itemservico2 = new ItemServico(nome: "Cabelo", tempo:00.3, valor:200.50);

    listaServicosGlobal.add(itemservico);
    listaServicosGlobal.add(itemservico2);
    */

    // TODO: Adicionar rota em algum arquivo de configuração
    final response = await http
        .get(Uri.parse('https://localhost/api/Servico?code=hehehehehe'));

    if (response.statusCode == 200) {

      ResultApi resultApi = await ResultApi.fromJson(jsonDecode(response.body));
      return resultApi.value;
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    String _selectedValue; // TODO: Será removido na hora de passar para a próxima etapa

    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 70.0, horizontal: 70.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.asset("assets/logo_assinatura.png", width: 250),
                FutureBuilder(
                  future:fetchService(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return snapshot.hasData
                        ? Container(
                      child: DropdownButton<String>(
                        hint: Text("Selecione um Serviço" ?? 'Make a selection'),
                        items: snapshot.data.map<DropdownMenuItem<String>>((item) {
                          return DropdownMenuItem<String>(
                            value: 12.toString(), // TODO: Trocar pelo id do serviço
                            child: Text(item.nome + " - R\$ " + item.valor.toString()),
                          );
                        }).toList(),
                        onChanged: (value) {
                          _selectedValue = value.toString();
                          Navigator.of(context).pushReplacementNamed('/horarios');
                        },
                      ),
                    )
                        : Container(
                      child: Center(
                        child: Text('Buscando serviços...'),
                      ),
                    );
                  },
                ),
                SizedBox(height: 290),
                ButtonTheme(
                  height: 60.0,
                  minWidth: 250.0,
                  child: RaisedButton(
                    onPressed: () =>
                        {Navigator.of(context).pushReplacementNamed('/agendamentos')},
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    child: Text("MEUS AGENDAMENTOS",
                        style: TextStyle(color: Colors.white70, fontSize: 15)),
                  ),
                ),
                SizedBox(height: 25),
                ButtonTheme(
                  height: 60.0,
                  minWidth: 250.0,
                  child: RaisedButton(
                    onPressed: () =>
                        {Navigator.of(context).pushReplacementNamed('/login')},
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    child: Text("SAIR",
                        style: TextStyle(color: Colors.black, fontSize: 15)),
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
