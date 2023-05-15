import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demoofbloc/data/cart_items.dart';
import 'package:demoofbloc/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartRemovefromCartEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItem));
  }

  FutureOr<void> cartRemovefromCartEvent(
      CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    cartItem.remove(event.productDataModel);
    emit(CartSuccessState(cartItems: cartItem));
  }
}
