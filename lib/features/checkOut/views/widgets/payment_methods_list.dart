import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';
import 'package:restaurant_app_sonic/features/checkOut/models/payment_method_model_ui.dart';
import 'package:restaurant_app_sonic/features/checkOut/models/payment_method_type.dart';
import 'package:restaurant_app_sonic/features/checkOut/views/widgets/payment_way_card_widget.dart';

class PaymentMethodsList extends StatelessWidget {
  const PaymentMethodsList({
    super.key,
    required this.paymentMethods,
    required this.paymentWayNotifier,
  });

  final List<PaymentMethodModelUi> paymentMethods;
  final ValueNotifier<PaymentMethodType> paymentWayNotifier;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(paymentMethods.length, (index) {
        return Padding(
          padding: EdgeInsets.only(bottom: Screen.h * .02),
          child: PaymentWayCardWidget(
            onTap: () => paymentWayNotifier.value = paymentMethods[index].type,
            groupValue: paymentWayNotifier.value.name,
            onChanged: (value) {
              PaymentMethodType.values.firstWhere((e) => e.name == value);
            },
            value: paymentMethods[index].type.name,
            paymentMethod: paymentMethods[index],
          ),
        );
      }),
    );
  }
}
