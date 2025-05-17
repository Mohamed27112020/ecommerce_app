import 'package:ecommerce_app/features/HomeScreen/productmodel.dart';

abstract class CartStates {}

class CartInitialState extends CartStates {}

class CartLoadingState extends CartStates {}

class CartErrorState extends CartStates {
  final String error;
  CartErrorState(this.error);
}

class CartSuccessState extends CartStates {
  final List<Product> Cartlist;
  CartSuccessState(this.Cartlist);
}

class CartTotalPriceState extends CartStates {}
