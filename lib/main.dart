import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/view/main_screen.dart';
import 'controller/bloc/bottom/bottom_navigation_bloc.dart';
import 'controller/bloc/cart/cart_bloc.dart';
import 'controller/bloc/home/home_bloc.dart';
import 'services/localstorege.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => CartBloc(ProductLocalStorage())),
        BlocProvider(create: (context) => BottomNavigationBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-commerce App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: BottomNavigatonPage(),
      ),
    );
  }
}
