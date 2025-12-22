import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/constants/app_images.dart';
import 'package:restaurant_app_sonic/core/constants/route_names.dart';
import 'package:restaurant_app_sonic/features/orders_history/presentation/data/models/order_history_model.dart';

class OrderHistoryCard extends StatelessWidget {
  const OrderHistoryCard({super.key, required this.order});
  final OrderHistoryModel order;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        RouteNames.orderDetaisView,
        arguments: order,
      ),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              order.productImage == null || order.productImage!.isEmpty
                  ? Image.asset(AppImages.buragerImg, height: 140)
                  : Hero(
                      tag: order.id,
                      child: FadeInImage.assetNetwork(
                        height: 140,
                        placeholder: AppImages.sandyLoading_,
                        image: order.productImage!,
                      ),
                    ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(order.status, style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 8),
                  Text(order.totalPrice, style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 8),
                  Text(order.createdAt, style: const TextStyle(fontSize: 18)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
