import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CadastroClientePage extends StatelessWidget {
  const CadastroClientePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset("assets/logo_assinatura.png", width: 200),
            Text('CADASTRO',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            SizedBox(height: 25),
            Container(
              height: 45,
              width: 400,
              //padding: EdgeInsets.symmetric(horizontal: 1),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: ('Nome')),
              ),
            ),
            SizedBox(height: 25),
            Container(
              height: 45,
              width: 400,
              //padding: EdgeInsets.symmetric(horizontal: 1),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: ('Telefone')),
              ),
            ),
            SizedBox(height: 25),
            Container(
              height: 45,
              width: 400,
              //padding: EdgeInsets.symmetric(horizontal: 1),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: ('Nascimento')),
              ),
            ),
            SizedBox(height: 25),
            Container(
              height: 45,
              width: 400,
              //padding: EdgeInsets.symmetric(horizontal: 1),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: ('Senha')),
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
                child: Text("CADASTRAR",
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
                child: Text("VOLTAR",
                    style: TextStyle(color: Colors.black, fontSize: 15)),
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
