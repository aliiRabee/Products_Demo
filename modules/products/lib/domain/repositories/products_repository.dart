import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:products/domain/entity/product_entity.dart';

abstract class ProductsRepository {
  Future<Either<Failure, ProductEntity>> getProducts();
}
