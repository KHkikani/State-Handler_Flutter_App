import 'package:fast_food_ordering/models/itemsModel.dart';
import 'package:fast_food_ordering/providers/cartProvider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  TextStyle txtStyle = GoogleFonts.ubuntu(
    color: Colors.grey,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  bool favouriteStatus = false;

  int quantity = 0;

  // final FavouritesController favouritesController =
  // Get.find<FavouritesController>();
  // final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    ItemsModel res = ModalRoute.of(context)!.settings.arguments as ItemsModel;
    // favouriteStatus = res.isFavourite;

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          const SizedBox(height: 42),
          Row(
            children: [
              const SizedBox(width: 12),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  // Get.back();
                },
                child: Container(
                  height: 45,
                  width: 45,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                "Food Details",
                style: GoogleFonts.ubuntu(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
            ],
          ),
          const Spacer(),
          Stack(
            alignment: const Alignment(0, -1.40),
            children: [
              Container(
                height: height * 0.7,
                width: width,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(42),
                    topRight: Radius.circular(42),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.16),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${res.name}",
                              style: GoogleFonts.ubuntu(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Rs ${res.price}",
                              style: GoogleFonts.ubuntu(
                                color: Colors.green,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(height: 28),

                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                            color: Colors.red),
                        height: 60,
                        width: 175,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                onPressed: () {
                                  if (quantity > 1) {
                                    setState(() {
                                      quantity++;
                                    });
                                  }
                                },
                                icon: Icon(Icons.remove)),
                            Text(
                              "${quantity}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 20),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    quantity++;
                                  });
                                },
                                icon: Icon(Icons.add)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("⭐ ${res.rating}", style: txtStyle),
                        Text(
                          "🩸 100 Kcal",
                          style: txtStyle,
                        ),
                        Text("⌚ 30 min", style: txtStyle),
                      ],
                    ),
                    const SizedBox(height: 44),
                    Text(
                      "About food",
                      style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      "${res.detail}",
                      style: GoogleFonts.ubuntu(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 65,
                      width: width,
                      margin: const EdgeInsets.symmetric(vertical: 18),
                      child: ElevatedButton(
                        onPressed: () {
                          res.selectedItem = quantity;
                          Provider.of<CartProvider>(context, listen: false)
                              .addToCart(items: res);
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          textStyle: GoogleFonts.ubuntu(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        child: const Text("Add to Cart"),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 175,
                width: 175,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image:AssetImage(res.image)
                  )
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
