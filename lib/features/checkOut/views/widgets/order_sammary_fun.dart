import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/utils/res_text_size.dart';

Row orderSammaryDetailRow(
  BuildContext context,
  String title,
  String price, {
  bool isbold = false,
  bool isSmall = false,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: ResTextSize.getResFontSize(
            context,
            fontSize: isSmall ? 13 : 16,
          ),
          color: isbold ? Colors.black : Colors.grey.shade700,
          fontWeight: isbold ? FontWeight.bold : FontWeight.w500,
        ),
      ),
      Text(
        price,
        style: TextStyle(
          fontSize: ResTextSize.getResFontSize(
            context,
            fontSize: isSmall ? 13 : 16,
          ),
          color: isbold ? Colors.black : Colors.grey.shade700,
          fontWeight: isbold ? FontWeight.bold : FontWeight.w500,
        ),
      ),
    ],
  );
}
