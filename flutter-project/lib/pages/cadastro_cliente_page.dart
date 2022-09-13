import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CadastroClientePage extends StatelessWidget {
  const CadastroClientePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      padding: EdgeInsets.only(top: 60, left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.asset("assets/logo_assinatura.png",
            width:200

          ),
          Text(      '     CADASTRO',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)

          ),
         SizedBox(height: 25),
      Container(
        height: 45,
        width: 400,
        //padding: EdgeInsets.symmetric(horizontal: 1),
        child: TextField(decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: ('Nome')
        ),


        ),
      )

        ],


      ),


    ),
    );
  }
}