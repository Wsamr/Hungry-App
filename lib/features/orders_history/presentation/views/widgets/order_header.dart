import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/utils/res_text_size.dart';
import 'package:restaurant_app_sonic/features/orders_history/presentation/data/models/order_details_model.dart';

class OrderHeader extends StatelessWidget {
  final OrderDetailsModel order;
  const OrderHeader({required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Order #${order.id}",
                style: TextStyle(
                  fontSize: ResTextSize.getResFontSize(context, fontSize: 18),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(order.createdAt),
            ],
          ),
          Chip(
            label: Text(order.status),
            backgroundColor: Colors.orange,
            labelStyle: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
