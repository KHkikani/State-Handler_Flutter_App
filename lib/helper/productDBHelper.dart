import 'package:cloud_firestore/cloud_firestore.dart';

class ProductDBHelper {
  ProductDBHelper._();

  static final ProductDBHelper productDBHelper = ProductDBHelper._();

  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  Future<void> addMenuItems({required Map<String, dynamic> data}) async {
    await fireStore.collection("Menu").add(data);
  }

  Future<void> addItems(
      {required String collectionName,
      required Map<String, dynamic> data}) async {
    await fireStore.collection(collectionName).add(data);
  }

  // Future<List<MenuItemsModel>> fetchMenuItems() async {
  //   late List<MenuItemsModel> menu;
  //   await fireStore.collection("Menu").get().then((event) {
  //     menu = event.docs
  //         .map((e) => MenuItemsModel.fromMap(data: e.data()))
  //         .toList();
  //   });
  //   return menu;
  // }

  Future<List<Map<String, dynamic>>> fetchItems(
      {required String collectionName}) async {
    late List<Map<String, dynamic>> item;
    await fireStore.collection(collectionName).get().then((event) {
      item = event.docs.map((e) => e.data()).toList();
    });
    return item;
  }
}
