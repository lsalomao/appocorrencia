import 'package:app_ocorrencia/app/constantes/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Ocorrência"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  _configPage() {
    Modular.to.pushNamed(AppRoutes.CONFIG);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
            ),
            onPressed: _configPage,
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text(controller.getEmail()),
              accountName: Text(controller.getNome()),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "http://fadami.tmp.br/coliseu/Arquivos/FotoPerfil/561b3ebe16d64db25e9bab068c71adc8/sem-foto.png"),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "http://fadami.tmp.br/coliseu/Fadami/img/LogoEmpresa.png",
                  ),
                ),
                color: Color.fromRGBO(70, 130, 180, 1),
              ),
              otherAccountsPictures: <Widget>[],
            ),
            Ink(
              color: Colors.black12,
              child: ListTile(
                title: Text(
                  'Ocorrência',
                  style: TextStyle(
                    color: Color.fromRGBO(70, 130, 180, 1),
                  ),
                ),
                onTap: () {
                  Modular.to.pushNamed(AppRoutes.LIST_OCORRENCIA);
                },
              ),
            ),
            Divider(
              color: Colors.black,
              height: 5.0,
            ),
            Ink(
              color: Colors.black12,
              child: ListTile(
                title: Text(
                  'Logout',
                  style: TextStyle(
                    color: Color.fromRGBO(70, 130, 180, 1),
                  ),
                ),
                onTap: () {
                  Modular.to.pushNamed(AppRoutes.SPLASH);
                },
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          Center(
            child: Text(
              'Sejam Bem-Vindos',
              style: TextStyle(
                color: Color.fromRGBO(70, 130, 180, 1),
                fontSize: 30,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            child: Image.asset(
              "assets/images/LogoEmpresa.png",
            ),
            height: 100,
            width: 100,
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(30),
            child: Text(
              'Este Aplicativo irá servir para você informar todas as ocorrências que acontecerem na via',
              style: TextStyle(
                color: Color.fromRGBO(70, 130, 180, 1),
                fontSize: 18,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}

// GestureDetector(
//   onTap: () {
//     Modular.to.pushNamed(AppRoutes.LIST_OCORRENCIA);
//   },
//   child: Container(
//     child: Image.asset('assets/images/LogoEmpresa.png'),
//   ),
// ),
