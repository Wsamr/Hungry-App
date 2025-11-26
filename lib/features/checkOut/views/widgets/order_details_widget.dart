import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/constants/app_strings.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';
import 'package:restaurant_app_sonic/features/checkOut/views/check_out_view.dart';
import 'package:restaurant_app_sonic/features/checkOut/views/widgets/order_sammary_fun.dart';

class OrderDetailsWidget extends StatelessWidget {
  const OrderDetailsWidget({
    super.key,
    required this.order,
    required this.taxes,
    required this.deliveryFees,
    required this.total,
  });
  final String order, taxes, deliveryFees, total;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        mainText(context, AppStrings.orderSummary),
        SizedBox(height: Screen.h * .01),
        orderSammaryDetailRow(context, AppStrings.order, "\$$order"),
        SizedBox(height: Screen.h * .01),
        orderSammaryDetailRow(context, AppStrings.taxes, "\$$taxes"),
        SizedBox(height: Screen.h * .01),
        orderSammaryDetailRow(
          context,
          AppStrings.deliveryFees,
          "\$$deliveryFees",
        ),
        Divider(),
        SizedBox(height: Screen.h * .01),
        orderSammaryDetailRow(
          context,
          "${AppStrings.total}:",
          "\$$total",
          isbold: true,
        ),
        SizedBox(height: Screen.h * .01),
        orderSammaryDetailRow(
          context,
          AppStrings.estimatedDelivery,
          "15 - 30 mins",
          isbold: true,
          isSmall: true,
        ),
      ],
    );
  }
}
