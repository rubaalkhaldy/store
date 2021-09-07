import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/ui/product_details/providers/product_details_provider.dart';

class ProductDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Color(0xffe3aa84),
        title: Text('Product Details'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Consumer<ProductDetailsProvider>(
          builder: (context, provider, x) {
            return provider.product == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Image.network(provider.product.image),
                        height: MediaQuery.of(context).size.height / 4,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(provider.product.title),
                      SizedBox(
                        height: 20,
                      ),
                      Text(provider.product.price.toString()),
                      SizedBox(
                        height: 20,
                      ),
                      Text(provider.product.description)
                    ],
                  );
          },
        ),
      ),
    );
  }
}
