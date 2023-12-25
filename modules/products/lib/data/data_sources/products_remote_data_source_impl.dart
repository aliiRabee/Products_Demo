import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:products/data/models/products_response.dart';

import '../../domain/data_sources/products_remote_data_source.dart';

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final NetworkHandler _networkHandler;

  ProductsRemoteDataSourceImpl(this._networkHandler);

  @override
  Future<Either<Failure, ProductsResponse>> getProducts() async {
    final response = await _networkHandler.get<ProductsResponse>(
        ProductsResponse(), 'products');

    if (response.isRequestSuccess) {
      return Right(response.body);
    } else {
      return Left(Failure(response.errorMessage!));
    }
  }
}
