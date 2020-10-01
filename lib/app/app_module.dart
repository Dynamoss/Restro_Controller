import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:resto_controller/app/modules/home/home_module.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'modules/cadastro/cadFornecedores/cadForn_module.dart';
import 'modules/cadastro/cadProdutos/cadProd_module.dart';
import 'modules/fornecedores/forn_controller.dart';
import 'modules/fornecedores/forn_module.dart';

import 'modules/produtos/prod_controller.dart';
import 'modules/produtos/prod_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => AppController(),
        ),
        Bind(
          (i) => FornController(),
        ),
        Bind(
          (i) => ProdController(),
        )
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<Router> get routers => [
        Router(
          '/forn',
          module: FornModule(),
        ),
        Router(
          '/cad-forn',
          module: CadFornModule(),
        ),
        Router(
          '/cad-prod',
          module: CadProdModule(),
        ),
        Router(
          '/prod',
          module: ProdModule(),
        ),
        Router(
          '/',
          module: HomeModule(),
        )
      ];
}
