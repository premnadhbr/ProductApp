import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:product_app/view/cart_screen.dart';
import 'package:product_app/view/home_screen.dart';

import '../controller/bloc/bottom/bottom_navigation_bloc.dart';

class BottomNavigatonPage extends StatelessWidget {
  BottomNavigatonPage({super.key});

  List<Widget> screens = <Widget>[
    const HomeScreen(),
    const CartScreen(),
  ];

  BottomNavigationBloc BottomNavigatonPageBloc = BottomNavigationBloc();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      bloc: BottomNavigatonPageBloc,
      builder: (context, state) {
        return Scaffold(
          body: screens.elementAt(state.tabIndex),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: const Color.fromARGB(255, 203, 201, 195),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black,
            unselectedIconTheme: const IconThemeData(color: Colors.white),
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            items: const [
              BottomNavigationBarItem(icon: Icon(Ionicons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Ionicons.cart), label: 'Search'),
            ],
            currentIndex: state.tabIndex,
            unselectedItemColor: const Color.fromARGB(255, 207, 205, 205),
            onTap: (value) {
              BottomNavigatonPageBloc.add(
                TabChangeEvent(tabIndex: value),
              );
            },
          ),
        );
      },
    );
  }
}
