import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';
import 'package:restaurant_app_sonic/features/cart/views/widgets/cart_item_widget.dart';

class CartItemsList extends StatefulWidget {
  const CartItemsList({super.key});

  @override
  State<CartItemsList> createState() => _CartItemsListState();
}

class _CartItemsListState extends State<CartItemsList> {
  final int countItem = 4;
  late List<ValueNotifier<int>> quanties;
  @override
  void initState() {
    quanties = List.generate(countItem, (_) => ValueNotifier(1));
    super.initState();
  }

  addCount(int index) {
    quanties[index].value++;
  }

  minusCount(int index) {
    if (quanties[index].value > 1) {
      quanties[index].value--;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Screen.w * .04),
      child: ListView.separated(
        itemCount: countItem,
        itemBuilder: (context, index) {
          return ValueListenableBuilder(
            valueListenable: quanties[index],
            builder: (context, value, child) {
              return CartItemWidget(
                value: quanties[index].value,
                removeOnTap: () {},
                addOnTap: () => addCount(index),
                minusOnTap: () => minusCount(index),
              );
            },
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: Screen.h * .03);
        },
      ),
    );
  }
}
