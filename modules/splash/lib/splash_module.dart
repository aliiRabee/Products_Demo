import 'package:dependencies/dependencies.dart';
import 'package:splash/presentation/pages/splash_page.dart';

class SplashModule extends Module {
  @override
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const SplashPage()),
  ];
}
