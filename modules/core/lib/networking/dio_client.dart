import 'package:core/networking/networking.dart';
import 'package:dependencies/dependencies.dart';

class DioClient {
  final ApiConfigurations configurations;

  DioClient({required this.configurations});

  Dio get dio => _getDio();

  Dio _getDio() {
    final options = BaseOptions(
      baseUrl: configurations.baseUrlProd,
      connectTimeout: const Duration(milliseconds: 50000),
      receiveTimeout: const Duration(milliseconds: 30000),
    );
    final dio = Dio(options);
    options.headers = {
      'Accept': 'application/json',
    };
    dio.interceptors.addAll([AuthInterceptor()]);
    return dio;
  }
}

class AuthInterceptor extends Interceptor {
  AuthInterceptor();

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // options.headers = {'Accept-Language': 'ar'};
    return super.onRequest(options, handler);
  }
}
