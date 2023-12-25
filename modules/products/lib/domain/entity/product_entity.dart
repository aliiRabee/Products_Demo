import 'package:dependencies/dependencies.dart';

class ProductEntity extends Equatable {
  final List<ProductDataEntity> productDataEntity;

  const ProductEntity({required this.productDataEntity});

  @override
  List<Object> get props => [productDataEntity];
}

class ProductDataEntity extends Equatable {
  final int id;
  final String title;
  final Object price;
  final String description;
  final String category;
  final String image;
  final Rating rating;

  const ProductDataEntity(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rating});

  @override
  List<Object> get props => [
        id,
        title,
        price,
        description,
        category,
        image,
        rating,
      ];
}

class Rating extends Equatable {
  const Rating({
    required this.rate,
    required this.count,
  });

  final Object rate;
  final int count;

  @override
  List<Object> get props => [rate, count];
}
