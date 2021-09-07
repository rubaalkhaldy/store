import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/ui/cart/providers/database_provider.dart';
import 'package:store/ui/home/models/all_products_response.dart';

class CartWidget extends StatelessWidget {
  AllProductsResponse product;
  CartWidget(this.product);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
         boxShadow: [
            BoxShadow(
                blurRadius: 5,
                spreadRadius: 1,
                color: Color(0xffe3aa84).withOpacity(0.4))
          ],
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            child: CachedNetworkImage(imageUrl: product.image),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title),
                SizedBox(
                  height: 10,
                ),
                Text(product.price.toString()),
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                Provider.of<DatabaseProvider>(context, listen: false)
                    .deleteProductInCart(product.id);
              },
              icon: Icon(
                Icons.delete,
                size: 30,
                color: Colors.redAccent,
              ))
        ],
      ),
    );
  }
}