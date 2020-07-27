import 'package:app_ocorrencia/app/app_controller.dart';
import 'package:app_ocorrencia/app/constantes/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> with WidgetsBindingObserver {
  final AppController appController = Modular.get<AppController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _changeTheme();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    _changeTheme();
  }

  _changeTheme() {
    var brightness = WidgetsBinding.instance.window.platformBrightness;
    brightness == Brightness.dark ? theme = darkTheme : theme = lightTheme;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Modular.navigatorKey,
      title: 'Ocorrência',
      theme: theme,
      initialRoute: AppRoutes.SPLASH,
      onGenerateRoute: Modular.generateRoute,
    );
  }
}

var theme = darkTheme;

var darkTheme = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.dark,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

var lightTheme = ThemeData(
  brightness: Brightness.light,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
