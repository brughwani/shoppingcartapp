part of 'shopping_cart_bloc.dart';

abstract class ShoppingCartEvent extends Equatable {
  const ShoppingCartEvent();
}
class  AddItem extends ShoppingCartEvent{

  final Products selectedItems;

  AddItem(this.selectedItems);

  @override
  List<Object?> get props => [];


}
class RemoveItem extends ShoppingCartEvent {
  final Products selectedItems;

  RemoveItem(this.selectedItems);


  @override

  List<Object?> get props => [];

}