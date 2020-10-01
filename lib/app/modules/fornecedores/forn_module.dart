import 'package:flutter_modular/flutter_modular.dart';

import 'forn_controller.dart';
import 'forn_page.dart';

class FornModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => FornController(),
        )
      ];

  @override
  List<Router> get routers => [
        Router(
          '/forn',
          child: (_, args) => FornPage(),
        ),
      ];

  static Inject get to => Inject<FornModule>.of();
}
