import 'package:core/core.dart';
import 'package:products/data/models/product_model.dart';

class ProductsResponse extends ListMappable {
  List<ProductModel>? productModel;

  ProductsResponse({this.productModel});

  @override
  Mappable fromJsonList(List json) {
    // if (json.isEmpty) {
    //   productModel = <ProductModel>[];
    // } else {
    //   productModel = <ProductModel>[];
    // }

    try {
      print("objectnvnvnvnnvnv");
      productModel =
          List.from(json).map((e) => ProductModel.fromJson(e)).toList();
      print(productModel!.length.toString() + " ini length");
    } catch (e) {
      print(e.toString());
      productModel = <ProductModel>[];
    }

    return ProductsResponse(productModel: productModel);
  }
}
