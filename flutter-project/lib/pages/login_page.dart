
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      padding: EdgeInsets.all(28),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/logo_nome.png",
          width: 250
          ),
          Text('LOGIN',
              style: const TextStyle(fontWeight: FontWeight.bold, height: 4, fontSize: 20)
          ),
          Text('Informe  seu nome e senha. Caso não possua cadastro, clique em "Cadastre-se" para criar sua conta.',
              textAlign: TextAlign.center),
          TextField(decoration: InputDecoration(labelText:'Login'),
          ),
          TextField(
              decoration: InputDecoration(
                  labelText: ('Senha'),
          ),
            obscureText:true,
          ),
          SizedBox(height: 15),
          ElevatedButton(onPressed: () {}, child: Text('Login'))

        ],
      ),
    ),
    );
  }
}