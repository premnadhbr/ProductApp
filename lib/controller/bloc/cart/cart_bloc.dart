import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../Model/product_model.dart';
import '../../../services/localstorege.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ProductLocalStorage localStorage;
  CartBloc(this.localStorage) : super(CartInitial()) {
    on<AddToCart>((event, emit) async {
      await localStorage.saveProducts([event.productModel]);
    });
    on<FetchData>(
      (event, emit) async {
        final data = await localStorage.getProducts();
        print(data);
        emit(ProductLoaded(data));
      },
    );
  }
}
