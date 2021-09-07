import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/ui/home/providers/home_provider.dart';

class CategoryWidget extends StatelessWidget {
  String title;
  CategoryWidget(this.title);
  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: () {
        Provider.of<HomeProvider>(context, listen: false).selectCategory(title);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Text(
          title.toString()[0].toUpperCase() + title.toString().substring(1),
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        decoration: BoxDecoration(
          //Color(0xffe3aa84)
            color: Provider.of<HomeProvider>(context).selectedCategory == title
            ?Color(0xffe39766)
            :Color(0xffe3aa84),
             borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}