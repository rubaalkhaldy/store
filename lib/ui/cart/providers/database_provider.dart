import 'package:flutter/material.dart';
import 'package:store/helpers/custom_dialoug.dart';
import 'package:store/ui/cart/data/sqflite_helper.dart';
import 'package:store/ui/home/models/all_products_response.dart';
import 'dart:convert';

class DatabaseProvider extends ChangeNotifier{
  List<AllProductsResponse> favouriteProdcts;
  List<AllProductsResponse> cartProdcts;
  getAllProductsInCart() async {
    List<Map<String, Object>> carts = await DbHelper.cartDbHelper.getCart();
    cartProdcts = carts.map((e) {
      dynamic productMap = json.decode(e[DbHelper.productDetailsColumn]);
      return AllProductsResponse.fromJson(productMap);
    }).toList();
    notifyListeners();
  }

  getAllProductsInFavourite() async {
    List<Map<String, Object>> carts =
        await DbHelper.cartDbHelper.getFavourite();
    favouriteProdcts = carts.map((e) {
      return AllProductsResponse.fromJson(e);
    }).toList();
    notifyListeners();
  }
  insertProductInCart(AllProductsResponse allProductsResponse) async {
    String product = json.encode(allProductsResponse.toJson());
    await DbHelper.cartDbHelper.addToCart(product, allProductsResponse.id);
    getAllProductsInCart();
  }

  insertProductInFavourite(AllProductsResponse allProductsResponse) async {
     await DbHelper.cartDbHelper.addToFavourite(allProductsResponse);
    getAllProductsInFavourite();
  }
  deleteProductInCart(int id) async {
    CustomDialoug.customDialoug.showCustomDialoug(
        'You will delete this product from cart, are you sure',
        'Alert',
        excuteDeltet,
        id);
  }

  excuteDeltet(int id) async {
    await DbHelper.cartDbHelper.removeFromCart(id);
    getAllProductsInCart();
  }

  deleteProductInFavourite(int id) async {
    CustomDialoug.customDialoug.showCustomDialoug(
        'You will delete this product from favourite, are you sure',
        'Alert',
        excuteFavDeltet,
        id);
  }

  excuteFavDeltet(int id) async {
    await DbHelper.cartDbHelper.removeFromFavourite(id);
    getAllProductsInFavourite();
  }
}