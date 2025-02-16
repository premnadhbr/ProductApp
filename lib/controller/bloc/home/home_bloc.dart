import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../Model/product_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeProductFetchEvent>((event, emit) async {
      const String apiUrl = 'https://fakestoreapi.com/products';

      Future<List<ProductModel>> fetchProducts() async {
        final response = await http.get(Uri.parse(apiUrl));

        if (response.statusCode == 200) {
          final List<dynamic> data = json.decode(response.body);
          return data
              .map((productJson) => ProductModel.fromJson(productJson))
              .toList();
        } else {
          throw Exception('Failed to load products');
        }
      }

      try {
        final products = await fetchProducts();
        emit(HomeLoaded(products));
      } catch (error) {
        emit(HomeError(error.toString()));
      }
    });
    
  }
}
