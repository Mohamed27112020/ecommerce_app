import 'package:ecommerce_app/features/CartScreen/Cart_Cubit/cartstates.dart';
import 'package:ecommerce_app/features/HomeScreen/productmodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitialState());

  List<Product> CartItems = [];


  int TotalPrice(List<Product> CartItems) {
    int totalPrice = 0;
    CartItems.forEach((element) {
      totalPrice += element.price.toInt();
    });
    emit(CartTotalPriceState());
    return totalPrice;
  }
}
