import 'package:art_core/ui_widgets/app_text.dart';
import 'package:art_core/ui_widgets/default_app_bar.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:products/presentation/products_page/get_products_bloc.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Modular.get<GetProductsBloc>()..add(GetProducts());

    return Scaffold(
        appBar: DefaultAppBar(
          hasBack: false,
          title: 'Products',
        ),
        body: BlocBuilder<GetProductsBloc, GetProductsState>(
            bloc: bloc,
            builder: (context, state) {
              if (state is GetProductsLoading) {
                return const Center(child: CupertinoActivityIndicator());
              } else if (state is GetProductsSuccess) {
                if (state.productEntity.productDataEntity.isNotEmpty) {
                  final product = state.productEntity.productDataEntity;
                  return ListView.builder(
                      itemCount: product.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                        image:
                                            NetworkImage(product[index].image),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AppText(
                                        title: product[index].title,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      SizedBox(height: 8),
                                      AppText(
                                        title: product[index].description,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 8),
                                      Row(children: [
                                        AppText(
                                          title: "\$${product[index].price}",
                                          fontWeight: FontWeight.bold,
                                        ),
                                        Expanded(child: SizedBox()),
                                        Icon(
                                          Icons.star_rate_rounded,
                                          size: 16,
                                          color: Colors.amber,
                                        ),
                                        AppText(
                                          title:
                                              "${product[index].rating.rate}/ ${product[index].rating.count}",
                                          color: Colors.black,
                                        ),
                                      ])
                                    ]),
                              ),
                              SizedBox(width: 16),
                            ],
                          ),
                        );
                      });
                } else {
                  return const Center(child: Text('No products'));
                }
              } else if (state is GetProductsError) {
                return Center(child: Text(state.errorMessage));
              } else {
                return Container(
                  color: Colors.red,
                );
              }
            }));
  }
}
