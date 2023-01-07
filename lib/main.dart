import 'package:fast_food_ordering/models/menuItemsModel.dart';
import 'package:fast_food_ordering/providers/cartProvider.dart';
import 'package:fast_food_ordering/res/menuItems.dart';
import 'package:fast_food_ordering/views/HomePage.dart';
import 'package:fast_food_ordering/views/cartPage.dart';
import 'package:fast_food_ordering/views/detailsPage.dart';
import 'package:fast_food_ordering/views/itemDetailsPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  MenuItemsModelList =
      menuList.map((e) => MenuItemsModel.fromMap(data: e)).toList();

  runApp(ChangeNotifierProvider(
    create: (context) => CartProvider(),
    builder: (context, child) => MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        'itemDetailsPage': (context) => const ItemDetailsPage(),
        'cartPage': (context) => const cartPage(),
        'detailsPage': (context) => const DetailsPage(),
      },
    ),
  ));
}
