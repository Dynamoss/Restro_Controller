import 'package:flutter_modular/flutter_modular.dart';

import 'cadProd_controller.dart';
import 'cadProd_page.dart';

class CadProdModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => CadProdController(),
        )
      ];

  @override
  List<Router> get routers => [
        Router(
          '/cad-prod',
          child: (_, args) => CadProdPage(),
        ),
      ];

  static Inject get to => Inject<CadProdModule>.of();
}
