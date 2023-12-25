import 'package:core/core.dart';
import 'package:products/data/models/products_response.dart';
import 'package:products/domain/entity/product_entity.dart';

class GetProductsMapper extends Mapper<ProductsResponse, ProductEntity> {
  @override
  List<ProductEntity> fromModelListToEntityList(
      List<ProductsResponse>? modelList) {
    return modelList
            ?.map((model) => ProductEntity(
                productDataEntity: model.productModel
                        ?.map((model) => ProductDataEntity(
                            price: model.price ?? 0,
                            id: model.id ?? 0,
                            title: model.title ?? "",
                            description: model.description ?? "",
                            image: model.image ?? "",
                            category: model.category ?? "",
                            rating: Rating(
                              rate: model.rating?.rate ?? 0,
                              count: model.rating?.count ?? 0,
                            )))
                        .toList() ??
                    []))
            .toList() ??
        [];
  }

  @override
  ProductEntity fromModelToEntity(ProductsResponse model) {
    return ProductEntity(
      productDataEntity: model.productModel
              ?.map((model) => ProductDataEntity(
                  price: model.price ?? 0,
                  id: model.id ?? 0,
                  title: model.title ?? "",
                  description: model.description ?? "",
                  image: model.image ?? "",
                  category: model.category ?? "",
                  rating: Rating(
                    count: model.rating?.count ?? 0,
                    rate: model.rating?.rate ?? 0.0,
                  )))
              .toList() ??
          [],
    );
  }
}
