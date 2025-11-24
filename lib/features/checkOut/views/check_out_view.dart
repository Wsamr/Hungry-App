import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/widgets/bottom_salary_container.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25),
              mainText("Order summary"),
              SizedBox(height: 15),
              orderSammaryDetailRow("Order", "\$16.48"),
              SizedBox(height: 10),
              orderSammaryDetailRow("Taxes", "\$0.3"),
              SizedBox(height: 10),
              orderSammaryDetailRow("Delivery fees", "\$1.5"),
              Divider(),
              SizedBox(height: 10),
              orderSammaryDetailRow("Total:", "\$18.19", isbold: true),
              SizedBox(height: 10),
              orderSammaryDetailRow(
                "Estimated delivery time:",
                "15 - 30 mins",
                isbold: true,
                isSmall: true,
              ),
              SizedBox(height: 40),
              mainText("Payment methods"),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomSlaryContainer(buttonName: "check out"),
    );
  }

  Text mainText(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
    );
  }

  Row orderSammaryDetailRow(
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
            fontSize: isSmall ? 13 : 15,
            color: isbold ? Colors.black : Colors.grey.shade700,
            fontWeight: isbold ? FontWeight.bold : FontWeight.w500,
          ),
        ),
        Text(
          price,
          style: TextStyle(
            fontSize: isSmall ? 13 : 15,
            color: isbold ? Colors.black : Colors.grey.shade700,
            fontWeight: isbold ? FontWeight.bold : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
