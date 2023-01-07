import 'package:fast_food_ordering/models/itemsModel.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<ItemsModel> cartList = [];
  int totalPrize = 0;

  get totalProduct => cartList.length;

  get totalPrice {
    int price = 0;

    for (ItemsModel item in cartList) {
      price += item.price * item.selectedItem;
    }
    return price;
  }

  void addToCart({required ItemsModel items}) {
    cartList.add(items);
    notifyListeners();
  }


  void changeSelectedItem({required ItemsModel item ,required int i}){
    item.selectedItem = i;
    notifyListeners();
  }

  void removeFromCart({required ItemsModel items}) {
    cartList.remove(items);
    notifyListeners();
  }
}
