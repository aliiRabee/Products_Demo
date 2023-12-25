import 'package:core/networking/api_constant.dart';
import 'package:core/networking/dio_client.dart';
import 'package:core/networking/network_handler.dart';
import 'package:core/router/navigator_keys.dart';
import 'package:dependencies/dependencies.dart';
import 'package:products/products_module.dart';
import 'package:splash/splash_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        ProductsModule(),
      ];

  @override
  final List<Bind> binds = [
    Bind.lazySingleton<DioClient>(
        (i) => DioClient(configurations: ApiConfigurations())),
    Bind.lazySingleton<Dio>((i) => i<DioClient>().dio),
    Bind.lazySingleton<NetworkHandler>((i) => NetworkHandler(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: SplashModule()),
    ModuleRoute(NavigatorKeys.PRODUCTS_KEY, module: ProductsModule()),
  ];
}
