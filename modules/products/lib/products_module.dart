import 'package:dependencies/dependencies.dart';
import 'package:products/data/repositories/products_repository_impl.dart';
import 'package:products/presentation/products_page/get_products_bloc.dart';
import 'package:products/presentation/products_page/products_page.dart';

import 'data/data_sources/products_remote_data_source_impl.dart';
import 'domain/mapper/get_products_mapper.dart';
import 'domain/use_cases/get_products_use_case.dart';

class ProductsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ProductsRemoteDataSourceImpl(i())),
    //
    Bind.lazySingleton((i) => GetProductsMapper()),

    //
    Bind.lazySingleton((i) => ProductsRepositoryImpl(i(), i())),
    //
    Bind.lazySingleton((i) => GetProductsUseCase(i())),

    //
    Bind.lazySingleton((i) => GetProductsBloc(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const ProductsPage()),
  ];
}
