import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/ui/home/models/all_products_response.dart';
import 'package:store/ui/home/providers/home_provider.dart';
import 'package:store/ui/home/ui/widgets/category_widget.dart';
import 'package:store/ui/home/ui/widgets/product_widget.dart';
import 'package:store/ui/product_details/providers/product_details_provider.dart';
import 'package:store/ui/product_details/ui/product_details.dart';
import 'package:easy_localization/easy_localization.dart';

class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Color(0xffe3aa84),
        title: Text('Home'.tr()),
        actions: [
          IconButton(
              onPressed: () {
                Locale currentLocale = context.locale;
                if (currentLocale == Locale('en')) {
                  context.setLocale(Locale('ar'));
                  // context.locale = Locale('ar');
                } else {
                  context.setLocale(Locale('en'));
                  //  context.locale = Locale('en');
                }
              },
              icon: Icon(Icons.language))
              
        ],
      ),
      body: Consumer<HomeProvider>(
        builder: (context, provider, x) {
          List<AllProductsResponse> allProducts = provider.allProducts;
          List<AllProductsResponse> products = provider.categoryProducts;
          List<dynamic> categories = provider.allCategories;

          return Container(
            margin: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                allProducts == null
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : CarouselSlider(
                        options: CarouselOptions(height: 200.0),
                        items: allProducts.take(4).map((element) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 3.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 5,
                                            spreadRadius: 1,
                                            color: Color(0xffe3aa84)
                                                .withOpacity(0.3))
                                      ]),
                                  child: CachedNetworkImage(
                                      imageUrl: element.image));
                            },
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                Text(
                  'All Categories'.tr(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                categories == null
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: provider.allCategories.map((e) {
                            return CategoryWidget(e);
                          }).toList(),
                        ),
                      ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'All Products'.tr(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'View All'.tr(),
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                products == null
                    ? Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    Provider.of<ProductDetailsProvider>(context,
                                            listen: false)
                                        .getProductResponse(products[index].id);
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return ProductDetails();
                                    }));
                                  },
                                  child: ProductWidget(products[index]));
                            }),
                      ),
              ],
            ),
          );
        },
      ),
      
    );
  }
}
