import 'package:flutter/material.dart';
import 'package:store/ui/home/ui/cart_page.dart';
import 'package:store/ui/home/ui/favourite_page.dart';
import 'package:store/ui/home/ui/home_page.dart';

class MainPage extends StatefulWidget{
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final tabs = [
    Container(child: HomePage(),),
    Container(child: FavouritePage(),),
    Container(child: CartPage(),),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Color(0xffe3aa84),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
    
            icon: Icon(
              
              Icons.favorite, 
            color: Color(0xffe3aa84)),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart, 
            color: Color(0xffe3aa84)),
            label: 'Cart',
          ),
        ],
        selectedItemColor: Color(0xffe3aa84),
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
          
        },
      ),

    );
  }
}