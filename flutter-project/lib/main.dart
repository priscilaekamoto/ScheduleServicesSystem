import 'package:flutter/material.dart';
import 'package:hb_sobrancelhas_maquiagem/pages/cadastro_cliente_page.dart';
import 'package:hb_sobrancelhas_maquiagem/pages/lista_horarios_page.dart';
import 'package:hb_sobrancelhas_maquiagem/pages/lista_servicos_page.dart';
import 'package:hb_sobrancelhas_maquiagem/pages/login_page.dart';
import 'package:hb_sobrancelhas_maquiagem/pages/splash_page.dart';
import 'palette.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Palette.kToDark,
      ),
      home: MyHomePage(title: 'HB - Sobrancelhas e Maquiagem'),
      initialRoute: '/splash',
      routes: {
        '/splash' : (_) => const SplashPage(),
        '/login' : (_) => const LoginPage(),
        '/cadastro' : (_) => const CadastroClientePage(),
        '/servicos' : (_) => const ListaServicosPage(),
        '/horarios' : (_) => const ListaHorariosPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
