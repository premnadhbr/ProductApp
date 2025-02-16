part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class AddToCart extends CartEvent {
  final ProductModel productModel;
  AddToCart( this.productModel);
}
class FetchData extends CartEvent{}
