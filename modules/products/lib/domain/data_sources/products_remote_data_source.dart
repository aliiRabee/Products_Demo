import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:products/data/models/products_response.dart';

abstract class ProductsRemoteDataSource {
  Future<Either<Failure, ProductsResponse>> getProducts();
}
