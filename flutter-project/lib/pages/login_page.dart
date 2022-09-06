
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
          Text('',
            style: const TextStyle(height: 2,  ),

          ), // TODO: Resolver problema de alinhamento do componente pai
          Text('Esqueci minha senha                                                          ',
              style: const TextStyle(height: 2, color: Colors.red)
          ),

          SizedBox(height: 15),
          ElevatedButton(onPressed: () {}, child: Text('Login'), style: ButtonStyle(),)

        ],
      ),
    ),
    );
  }
}