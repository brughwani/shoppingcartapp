import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/shopping_cart_bloc.dart';


class Checkout extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Checkout')),
        body: BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
          builder: (context, state) {
             final double sum=0.0;
             final double  total=state.selectedProducts.fold(0,(previous, current ) => previous + current.price );

            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: state.selectedProducts.length,
                      itemBuilder: (BuildContext context, i) {
                      
                        return ListTile(trailing: IconButton(onPressed: () =>
                            context.read<ShoppingCartBloc>().add(
                                RemoveItem(state.selectedProducts[i])),
                            icon: Icon(Icons.remove_shopping_cart_outlined)),
                          title: Text(state.selectedProducts[i].name),
                          subtitle: Text(state.selectedProducts[i].price.toString()),
                        );
                        
                      },
                      
                  ),
                ),
                Text(total.toString())
              ],
            );
          }

        ),
    );

  }


}
