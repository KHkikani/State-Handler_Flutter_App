import 'package:fast_food_ordering/models/menuItemsModel.dart';
import 'package:fast_food_ordering/res/items.dart';

List<MenuItemsModel> MenuItemsModelList = [];

List menuList = [
  {
    'image': 'asset/pizaa.png',
    'name': 'Pizza',
    'totalItems': pizzaItems.length.toInt(),
    'items': pizzaItems,
  },
  {
    'image': 'asset/download-removebg-preview (1).png',
    'name': 'Salads',
    'totalItems': saladsItem.length.toInt(),
    'items': saladsItem,
  },
  {
    'image': 'asset/dess.png',
    'name': 'Desserts',
    'totalItems': dessertsItem.length.toInt(),
    'items': dessertsItem,
  },
  {
    'image': 'asset/pasta.png',
    'name': 'Pasta',
    'totalItems': pastaItem.length.toInt(),
    'items': pastaItem,
  },
  {
    'image': 'asset/beverages.png',
    'name': 'Beverages',
    'totalItems': beveragesItem.length.toInt(),
    'items': beveragesItem,
  },
];