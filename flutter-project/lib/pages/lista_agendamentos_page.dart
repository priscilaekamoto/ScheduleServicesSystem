import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ListaAgendamentosPage extends StatelessWidget {
  const ListaAgendamentosPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        //color: Colors.red,
        padding: EdgeInsets.symmetric(vertical: 70.0, horizontal: 50.0),

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset("assets/logo_assinatura.png", width: 200),
              ListView(
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: <Widget>[
                  ListTile(
                    title: Text('Sobrancelha \n 12/12 11:00'),
                  ),
                  ListTile(
                    title: Text('Micropigmentação \n 12/12 11:00'),
                  ),
                  ListTile(
                    title: Text('Micropigmentação \n 12/12 11:00'),
                  ),
                  ListTile(
                    title: Text('Micropigmentação \n 12/12 11:00'),
                  ),
                  ListTile(
                    title: Text('Micropigmentação \n 12/12 11:00'),
                  ),
                  ListTile(
                    title: Text('Micropigmentação \n 12/12 11:00'),
                  ),
                  ListTile(
                    title: Text('Micropigmentação \n 12/12 11:00'),
                  ),
                  ListTile(
                    title: Text('Micropigmentação \n 12/12 11:00'),
                  ),
                  ListTile(
                    title: Text('Micropigmentação \n 12/12 11:00'),
                  ),
                  ListTile(
                    title: Text('Micropigmentação \n 12/12 11:00'),
                  ),
                  ListTile(
                    title: Text('Micropigmentação \n 12/12 11:00'),
                  ),
                  ListTile(
                    title: Text('Micropigmentação \n 12/12 11:00'),
                  ),
                  ListTile(
                    title: Text('Micropigmentação \n 12/12 11:00'),
                  ),
                  ListTile(
                    title: Text('Micropigmentação \n 12/12 11:00'),
                  ),
                  ListTile(
                    title: Text('Micropigmentação \n 12/12 11:00'),
                  ),
                  ListTile(
                    title: Text('Micropigmentação \n 12/12 11:00'),
                  ),
                  ListTile(
                    title: Text('Micropigmentação \n 12/12 11:00'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
