import 'package:app/app/core/stores/auth_store.dart';
import 'package:app/app/core/util/size_utils.dart';
import 'package:app/app/core/util/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  _SplashScreenPageState() {
    Modular.get<AuthStore>().checkLogin().then((v) {
      return Future.delayed(Duration(seconds: 1));
    }).then((isLogged) {
      if (isLogged != null) {
        Future.delayed(const Duration(milliseconds: 4500), () {
          print("logado");
          Navigator.popAndPushNamed(context, '/dashboard');
        });
      } else {
        print("não logado");
        Future.delayed(const Duration(milliseconds: 4500), () {
          Navigator.popAndPushNamed(context, '/login');
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeUtils.init(context);
    SizeUtils.init(context);
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          SizedBox(height: 10),
          Text('Inicializando o aplicativo')
        ],
      ),
    ));
    ;
  }
}
