import 'package:dependencies/dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:products/domain/entity/product_entity.dart';
import 'package:products/domain/use_cases/get_products_use_case.dart';

part 'get_products_event.dart';
part 'get_products_state.dart';

class GetProductsBloc extends Bloc<GetProductsEvent, GetProductsState> {
  final GetProductsUseCase getProductsUseCase;

  GetProductsBloc(this.getProductsUseCase) : super(GetProductsInitial()) {
    on<GetProducts>(_getProducts);
  }

  void _getProducts(GetProducts event, Emitter<GetProductsState> emit) async {
    try {
      emit(GetProductsLoading());
      final result = await getProductsUseCase.call();
      result.fold((failure) => emit(GetProductsError(failure.message)),
          (products) {
        emit(GetProductsSuccess(products));
      });
    } catch (e) {
      emit(GetProductsError(e.toString()));
    }
  }
}
