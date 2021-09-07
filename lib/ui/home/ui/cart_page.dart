import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/ui/cart/providers/database_provider.dart';
import 'package:store/ui/cart/ui/cartWidget.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Color(0xffe3aa84),
        title: Text('Cart Page'),
      ),
      body: Consumer<DatabaseProvider>(
        builder: (context, provider, x) {
          if (provider.cartProdcts == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                itemCount: provider.cartProdcts.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: CartWidget(provider.cartProdcts[index]),
                  );
                });
          }
        },
      ),
    );
  }
}