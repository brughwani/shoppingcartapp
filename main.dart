import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockinterview/Checkout.dart';
import 'package:mockinterview/HomeScreen.dart';
import 'package:mockinterview/bloc/shopping_cart_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
final commonbloc=ShoppingCartBloc();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: "/",
        routes: {
          "/": (BuildContext context) =>
              BlocProvider<ShoppingCartBloc>.value(
                value: commonbloc,
                child: HomeScreen(),
              ),
          "/Checkout": (BuildContext context) => BlocProvider<ShoppingCartBloc>.value(
            value: commonbloc,
            child: Checkout(),
          ),
        }
    );
  }
}



