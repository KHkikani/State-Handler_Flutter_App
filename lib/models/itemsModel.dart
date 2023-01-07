class ItemsModel {
  String image;
  String name;
  String rating;
  int weight;
  String detail;
  int selectedItem;
  int price;

  ItemsModel({
    required this.image,
    required this.name,
    required this.rating,
    required this.weight,
    required this.detail,
    required this.selectedItem,
    required this.price,
  });

  factory ItemsModel.fromMap({required Map<String, dynamic> data}) {
    return ItemsModel(
      image: data['image'],
      name: data['itemName'],
      rating: data['rating'],
      weight: data['weight'],
      detail: data['detail'],
      selectedItem: 1,
      price: data['prize'],
    );
  }
}
