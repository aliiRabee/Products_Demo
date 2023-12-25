part of 'get_products_bloc.dart';

@immutable
abstract class GetProductsState {}

class GetProductsInitial extends GetProductsState {}

class GetProductsLoading extends GetProductsState {}

class GetProductsSuccess extends GetProductsState {
  final ProductEntity productEntity;

  GetProductsSuccess(this.productEntity);
}

class GetProductsError extends GetProductsState {
  final String errorMessage;

  GetProductsError(this.errorMessage);
}
