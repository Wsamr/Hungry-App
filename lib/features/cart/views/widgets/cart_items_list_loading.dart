import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/features/cart/data/models/cart_item_model.dart';
import 'package:restaurant_app_sonic/features/cart/views/widgets/cart_item_widget.dart';
import 'package:shimmer/shimmer.dart';

class CartItemsListLoading extends StatelessWidget {
  CartItemsListLoading({super.key});
  final dummyItems = List.generate(
    3,
    (index) => CartItemModel(
      itemId: index,
      productId: index,
      name: "Loading...",
      image:
          "https://tse2.mm.bing.net/th/id/OIP.f3NQMlHGsdYEJVt6oQW17gHaHa?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3",
      price: "0",
      quantity: 1,
      spicy: 0,
      toppings: [],
      sideOptions: [],
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        itemCount: dummyItems.length,
        itemBuilder: (_, index) =>
            CartItemWidget(cartItemModel: dummyItems[index]),
      ),
    );
  }
}
