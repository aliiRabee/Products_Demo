import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:products/domain/entity/product_entity.dart';
import 'package:products/domain/repositories/products_repository.dart';

class GetProductsUseCase {
  final ProductsRepository _productsRepository;

  GetProductsUseCase(this._productsRepository);

  Future<Either<Failure, ProductEntity>> call() async {
    return await _productsRepository.getProducts();
  }
}
