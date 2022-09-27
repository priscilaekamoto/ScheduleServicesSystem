import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ItemHorario {
  int index;
  String value;

  ItemHorario(int id, String val) {
    index = id;
    value = val;
  }
}

class ListaHorariosPage extends StatelessWidget {
  const ListaHorariosPage({Key key}) : super(key: key);

  showAlertDialog(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("Agendar"),
      onPressed: () {},
    );
    Widget cancelarButton = FlatButton(
      child: Text("Cancelar"),
      onPressed: () {},
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

    List<ItemHorario> listaServicos = [
      new ItemHorario(1, "10:30"),
      new ItemHorario(2, "11:30"),
      new ItemHorario(3, "13:00"),
      new ItemHorario(4, "14:00"),
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
                    'Horários Disponíveis',
                  ),
                  //isExpanded: false,
                  onChanged: (item) {
                    _selectedValue = item.toString();
                    showAlertDialog(context);
                  },
                  items: listaServicos.map((ItemHorario item) {
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
