
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      padding: EdgeInsets.all(28),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.asset("assets/logo_nome.png",
          width: 250
          ),
          Text('LOGIN',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
          ),
          Text('',
              style: const TextStyle(height: 2)
          ),
          Text('Informe  seu nome e senha. Caso não possua cadastro, clique em "Cadastre-se" para criar sua conta.',
              textAlign: TextAlign.center,
          ),
          Text('',
              style: const TextStyle(height: 2)
          ),
          TextField(decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText:'Nome'),
          ),
          Text('',
              style: const TextStyle(height: 2)
          ),
          TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: ('Senha'),
          ),
            obscureText:true,
          ),
          SizedBox(height:5),
          Text('Esqueci minha senha                                                          ',
              style: const TextStyle(height: 2, color: Colors.red)
          ),

          SizedBox(height: 30),
          ButtonTheme(
            height: 60.0,
            minWidth: 250.0,

            child: RaisedButton(
              onPressed: () => {
                Navigator.of(context).pushReplacementNamed('/cadastro')
              },
              shape: new RoundedRectangleBorder(borderRadius:
            new BorderRadius.circular(30.0)),
      child: Text(
        "ENTRAR",
        style: TextStyle(color: Colors.white, fontSize: 15 )
      ),
            ),
                  ),
          SizedBox(height: 15),
          ButtonTheme(
            height: 60.0,
            minWidth: 250.0,
            child: RaisedButton(
              onPressed: () => {print("pressionei o botão"), },
              shape: new RoundedRectangleBorder(borderRadius:
              new BorderRadius.circular(30.0)),
              child: Text(
                "CADASTRE-SE",
                style: TextStyle(color: Colors.black, fontSize: 15 ),
              ),
              color: Colors.white70,

            ),
          ),


            ],
          ),

      ),
    );
    }
}