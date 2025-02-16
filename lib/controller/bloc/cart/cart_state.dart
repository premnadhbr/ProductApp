part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}
class ProductLoading extends CartState {}
class ProductLoaded extends CartState {
  final List<ProductModel> products;
  ProductLoaded(this.products);
}
class ProductError extends CartState {
  final String message;
  ProductError(this.message);
}