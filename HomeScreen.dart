import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';
import 'package:mockinterview/bloc/shopping_cart_bloc.dart';
import 'package:mockinterview/Checkout.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return

      BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: Text("ShopX"), actions: <Widget>[GFIconBadge(
              child: GFIconButton(
                onPressed: () {
Navigator.pushNamed(context,"/Checkout");
                },
                icon: Icon(Icons.shopping_cart),
                shape: GFIconButtonShape.circle,
              ),
              counterChild: GFBadge(
                child: Text(state.selectedProducts.length.toString()),
              ),
            )
            ]),
            body: ShopItemsWidget(),
          );
        },
      );
  }
}

class ShopItemsWidget extends StatelessWidget {
  const ShopItemsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
      builder: (context, state) {
        return GridView.count(
          primary: false,
          padding: const EdgeInsets.all(8),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            Container(
              color: Colors.teal[100],
              child:Container(
                child:Column(
children: [Image(image: NetworkImage(state.globalProducts[0].imageUrl),height: 80,width:50),
Text(state.globalProducts[0].name),
Text(state.globalProducts[0].price.toString()),

  IconButton(onPressed:() => context.read<ShoppingCartBloc>().add(AddItem(state.globalProducts[0])) , icon:Icon(Icons.add_shopping_cart))
],

                )
              ),
            ),
            Container(
              padding: const EdgeInsets.all(6),
              color: Colors.teal[100],
     child:   Column(
        children: [
                Image(image: NetworkImage(state.globalProducts[1].imageUrl),height:75,width:75),
        Text(state.globalProducts[1].name),
        Text(state.globalProducts[1].price.toString()),
          IconButton(onPressed:() => context.read<ShoppingCartBloc>().add(AddItem(state.globalProducts[1])) , icon:Icon(Icons.add_shopping_cart))
        ]
        ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[300],
              child: Column(
                  children: [
                    Image(image: NetworkImage(state.globalProducts[2].imageUrl),height: 50,width:50),
                    Text(state.globalProducts[2].name),
                    Text(state.globalProducts[2].price.toString()),
                    IconButton(onPressed:() => context.read<ShoppingCartBloc>().add(AddItem(state.globalProducts[2])) , icon:Icon(Icons.add_shopping_cart))

                  ]
              ),
            ),

          ],
        );
      },
    );
  }


}
