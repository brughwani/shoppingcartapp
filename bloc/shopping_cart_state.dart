part of 'shopping_cart_bloc.dart';

class ShoppingCartState extends Equatable {
   ShoppingCartState({ List<Products>? globalProducts,this.selectedProducts=const []}):
         globalProducts= globalProducts??[
           Products("Milk",80.0,"https://www.almarai.com/wp-content/uploads/2018/10/20210-MILK-FF-500ML-PET-EN_WEB.jpg"),
           Products("Apple",100.0,"https://media.istockphoto.com/photos/red-apple-picture-id184276818?k=20&m=184276818&s=612x612&w=0&h=QxOcueqAUVTdiJ7DVoCu-BkNCIuwliPEgtAQhgvBA_g="),
           Products("Banana",29.0,"https://api.time.com/wp-content/uploads/2019/11/gettyimages-459761948.jpg")];


  final List<Products> globalProducts;
  final List<Products> selectedProducts;

  @override

  List<Object?> get props => [globalProducts,selectedProducts];

   ShoppingCartState copyWith({
     List<Products>? globalProducts,
     List<Products>? selectedProducts

   }) {
     return ShoppingCartState(
         globalProducts:globalProducts ?? this.globalProducts,
       selectedProducts: selectedProducts ?? this.selectedProducts
     );
   }
}


