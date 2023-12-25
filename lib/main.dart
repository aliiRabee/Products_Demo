import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'app_module.dart';
import 'app_widget.dart';

Future<void> main() async {
  // await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ModularApp(
      debugMode: false,
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
