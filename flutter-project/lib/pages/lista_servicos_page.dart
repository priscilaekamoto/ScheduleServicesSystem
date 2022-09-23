import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ItemService {
  int index;
  String value;

  ItemService(int id, String val) {
    index = id;
    value = val;
  }
}

class ListaServicosPage extends StatelessWidget {
  const ListaServicosPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _selectedValue;

    List<ItemService> listaServicos = [
      new ItemService(1, "Depilação axila"),
      new ItemService(2, "Depialção buço"),
      new ItemService(3, "Depilação meia perna"),
      new ItemService(4, "Depilação nariz"),
    ];

    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          //color: Colors.red,
          padding: EdgeInsets.symmetric(vertical: 70.0, horizontal: 70.0),
          /*  decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/fundo_app.png"),
              fit: BoxFit.cover,
            ),
          ),*/

          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.asset("assets/logo_assinatura.png", width: 250),
                DropdownButton(
                  value: _selectedValue,
                  hint: Text(
                    'Selecione um Serviço',
                  ),
                  //isExpanded: false,
                  onChanged: (item) {
                    _selectedValue = item.toString();
                  },
                  items: listaServicos.map((ItemService item) {
                    return DropdownMenuItem(
                      value: item.index,
                      child: Text(
                        item.value,
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 290),
                ButtonTheme(
                  height: 60.0,
                  minWidth: 250.0,
                  child: RaisedButton(
                    onPressed: () =>
                        {Navigator.of(context).pushReplacementNamed('/login')},
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
