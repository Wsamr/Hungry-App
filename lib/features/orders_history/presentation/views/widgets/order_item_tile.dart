import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/features/orders_history/presentation/data/models/order_details_model.dart';

class OrderItemTile extends StatelessWidget {
  final OrderItemModel item;
  const OrderItemTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            item.image,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 4),
              Text(
                "Qty: ${item.quantity}",
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                "Spicy: ${item.spicy}",
                style: TextStyle(color: Colors.grey),
              ),

              if (item.topping.isNotEmpty)
                Text(
                  "Toppings: ${item.topping.map((e) => e.name).join(", ")}",
                  style: TextStyle(fontSize: 12),
                ),

              if (item.sideOption.isNotEmpty)
                Text(
                  "Sides: ${item.sideOption.map((e) => e.name).join(", ")}",
                  style: TextStyle(fontSize: 12),
                ),
            ],
          ),
        ),
        Text("${item.price} \$", style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
