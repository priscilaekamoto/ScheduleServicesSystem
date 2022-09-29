import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ListaAgendamentosPage extends StatelessWidget {
  const ListaAgendamentosPage({Key key}) : super(key: key);

  showAlertDialog(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("Sim"),
      onPressed: () =>
      {
        //Navigator.of(context).pushReplacementNamed('/agendamentos')
      },
    );
    Widget cancelarButton = FlatButton(
      child: Text("Não"),
      onPressed: () =>
      {
        Navigator.pop(context, false)
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Text("Deseja CANCELAR o agendamento do serviço Sobrancelha no dia 12/12/2022 às 11:00h?"),
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
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            //color: Colors.blue,
            width: 500,
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.only(top: 70),
            child: Image.asset("assets/logo_assinatura.png", width: 200, height: 200, fit:BoxFit.fill)
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Text("Meus Agendamentos",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            width: 400,
            height: 400,
            //color: Colors.red,
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  ListView(
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: <Widget>[
                      Card(
                        child: ListTile(
                          title: Text('Sobrancelha \n 12/12 11:00'),
                          onTap: ()  {
                            showAlertDialog(context);
                            print("Entrou aqui");
                          },
                          onLongPress: ()  {
                            print("Entrou aqui");
                          },
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text('Micropigmentação \n 12/12 11:00'),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text('Micropigmentação \n 12/12 11:00'),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text('Micropigmentação \n 12/12 11:00'),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text('Micropigmentação \n 12/12 11:00'),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text('Micropigmentação \n 12/12 11:00'),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text('Micropigmentação \n 12/12 11:00'),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text('Micropigmentação \n 12/12 11:00'),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text('Micropigmentação \n 12/12 11:00'),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text('Micropigmentação \n 12/12 11:00'),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text('Micropigmentação \n 12/12 11:00'),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text('Micropigmentação \n 12/12 11:00'),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text('Micropigmentação \n 12/12 11:00'),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text('Micropigmentação \n 12/12 11:00'),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text('Micropigmentação \n 12/12 11:00'),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text('Micropigmentação \n 12/12 11:00'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 35),
            padding: EdgeInsets.symmetric(horizontal: 65.0),
            child: ButtonTheme(
              height: 60.0,
              minWidth: 250.0,
              child: RaisedButton(
                onPressed: () =>
                {
                  Navigator.of(context).pushReplacementNamed('/login')
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)
                ),
                child: Text("SAIR",
                    style: TextStyle(color: Colors.white, fontSize: 15)),
                    color: Colors.black,
              ),
            ),

          )
        ],
      )
    );
  }
}
