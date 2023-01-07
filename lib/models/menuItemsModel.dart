import 'package:fast_food_ordering/models/itemsModel.dart';

class MenuItemsModel {
  String image;
  String name;
  int totalItem;
  List<ItemsModel> items;

  MenuItemsModel({
    required this.image,
    required this.name,
    required this.totalItem,
    required this.items,
  });

  factory MenuItemsModel.fromMap({required Map<String, dynamic> data}) {
    List<ItemsModel> items = [];


        data['items'].forEach((e) {

          items.add(ItemsModel.fromMap(data: e));

        });


    // print(items.length);

    return MenuItemsModel(
      image: data['image'],
      name: data['name'],
      totalItem: data['totalItems'],
      items: items,
    );
  }
}
