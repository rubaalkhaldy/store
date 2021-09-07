import 'package:flutter/material.dart';
import 'package:store/ui/home/models/all_products_response.dart';
import 'package:store/ui/product_details/data/api_helper.dart';

class ProductDetailsProvider extends ChangeNotifier {
  AllProductsResponse product;
  getProductResponse(int id) async {
    product = null;
    product = await ProductDetailsApiHelper.apiHelper.getProductDetails(id);
    notifyListeners();
  }
}