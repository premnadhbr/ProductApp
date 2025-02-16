import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/bloc/cart/cart_bloc.dart';
import 'widget/product_card.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CartBloc>(context).add(FetchData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Cart")),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is ProductLoaded) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return ProductCard(productModel: product);
              },
            );
          } else if (state is ProductError) {
            return Center(
                child: Text(state.message,
                    style: const TextStyle(color: Colors.red)));
          }
          return const Center(child: Text("Your cart is empty!"));
        },
      ),
    );
  }
}
