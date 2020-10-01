import 'package:flutter_modular/flutter_modular.dart';
import 'package:resto_controller/app/modules/produtos/prod_controller.dart';
import 'package:resto_controller/app/modules/produtos/prod_page.dart';

class ProdModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => ProdController(),
        )
      ];

  @override
  List<Router> get routers => [
        Router(
          '/',
          child: (_, args) => ProdPage(),
        ),
      ];

  static Inject get to => Inject<ProdModule>.of();
}
