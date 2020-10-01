import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'interfaces/theme_app_interface.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {}
