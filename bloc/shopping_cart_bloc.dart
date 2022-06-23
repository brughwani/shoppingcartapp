import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mockinterview/Products.dart';

part 'shopping_cart_event.dart';
part 'shopping_cart_state.dart';

class ShoppingCartBloc extends Bloc<ShoppingCartEvent, ShoppingCartState> {
  ShoppingCartBloc() : super(ShoppingCartState()) {
    on<AddItem>(_onAddItem);
    on<RemoveItem>(_onRemoveItem);
  }

  void _onAddItem(AddItem event, Emitter<ShoppingCartState> emit) {
    final isProductAvailable=state.selectedProducts.contains(event.selectedItems);
    if(isProductAvailable)
      {
        return;
      }
    final newList=[...state.selectedProducts,event.selectedItems];
    emit(state.copyWith(selectedProducts:newList));

  }
  void _onRemoveItem(RemoveItem event, Emitter<ShoppingCartState> emit) {
    final isProductAvailable=state.selectedProducts.contains(event.selectedItems);
    if(!isProductAvailable)
    {

      return;
    }
    final newList=state.selectedProducts.where((product) =>product != event.selectedItems ).toList();
    emit(state.copyWith(selectedProducts:newList));
  }
}
