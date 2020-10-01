import 'package:flutter_modular/flutter_modular.dart';

import 'cadForn_controller.dart';
import 'cadForn_page.dart';

class CadFornModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => CadFornController(),
        )
      ];

  @override
  List<Router> get routers => [
        Router(
          '/cad-forn',
          child: (_, args) => CadFornPage(),
        ),
      ];

  static Inject get to => Inject<CadFornModule>.of();
}
