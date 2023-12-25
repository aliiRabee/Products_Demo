import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:products/domain/entity/product_entity.dart';
import 'package:products/domain/mapper/get_products_mapper.dart';
import 'package:products/domain/repositories/products_repository.dart';

import '../../domain/data_sources/products_remote_data_source.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSource _dataSource;
  final GetProductsMapper _getProductsMapper;

  ProductsRepositoryImpl(this._dataSource, this._getProductsMapper);

  @override
  Future<Either<Failure, ProductEntity>> getProducts() async {
    final res = await _dataSource.getProducts();
    return res.fold(
        (l) => Left(l), (r) => Right(_getProductsMapper.fromModelToEntity(r)));
  }
}
