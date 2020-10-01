import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:provider/provider.dart';
import 'package:resto_controller/app/modules/fornecedores/forn_controller.dart';

import 'modules/produtos/prod_controller.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProdController(),
        ),
        ChangeNotifierProvider(
          create: (context) => FornController(),
        ),
      ],
      child: MaterialApp(
        title: 'Retro Controller',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.orange,
            visualDensity: VisualDensity.adaptivePlatformDensity),

        /*SplashPage(),*/
        initialRoute: '/',
        navigatorKey: Modular.navigatorKey,
        onGenerateRoute: Modular.generateRoute,
      ),
    );
  }
}
