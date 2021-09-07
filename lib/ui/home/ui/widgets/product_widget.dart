import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:store/ui/cart/providers/database_provider.dart';
import 'package:store/ui/home/models/all_products_response.dart';

class ProductWidget extends StatelessWidget {
  AllProductsResponse product;
  ProductWidget(this.product);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                blurRadius: 5,
                spreadRadius: 1,
                color: Color(0xffe3aa84).withOpacity(0.4))
          ]),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: Column(
        children: [
          Expanded(
            child: CachedNetworkImage(
              imageUrl: product.image,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 50,
            child: Row(
              children: [
                Expanded(child: Text(product.title)),
                Spacer(),
                Text(product.price.toString())
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () {
                  Provider.of<DatabaseProvider>(context, listen: false)
                      .insertProductInFavourite(product);
                  
                },
              ),
              IconButton(
                icon: Icon(Icons.add_shopping_cart),
                onPressed: () {
                  Provider.of<DatabaseProvider>(context, listen: false)
                      .insertProductInCart(product);
                      
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
