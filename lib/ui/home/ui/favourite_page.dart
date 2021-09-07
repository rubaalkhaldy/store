import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/ui/cart/providers/database_provider.dart';

class FavouritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Color(0xffe3aa84),
          title: Text('Favourite Page'),
        ),
        body: Consumer<DatabaseProvider>(
          builder: (context, provider, x) {
            if (provider.favouriteProdcts == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10),
                    itemCount: provider.favouriteProdcts.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                  boxShadow: [
                                BoxShadow(
                                    blurRadius: 5,
                                    spreadRadius: 1,
                                    color: Color(0xffe3aa84).withOpacity(0.5))
                              ],
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    //  fit: BoxFit.cover,
                                      image: NetworkImage(provider
                                          .favouriteProdcts[index].image)))),
                          Positioned.fill(
                              child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              child: IconButton(
                                  onPressed: () {
                                    provider.deleteProductInFavourite(
                                        provider.favouriteProdcts[index].id);
                                  },
                                  icon: Icon(
                                    Icons.favorite,
                                    color: Colors.redAccent,
                                    size: 26,
                                  )),
                            ),
                          ))
                        ],
                      );
                    }),
              );
            }
          },
        ));
  }
}
