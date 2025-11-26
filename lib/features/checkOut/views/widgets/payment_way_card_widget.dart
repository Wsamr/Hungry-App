import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/features/checkOut/models/payment_method_model_ui.dart';
import 'package:restaurant_app_sonic/features/checkOut/views/widgets/custom_radio_button.dart';

class PaymentWayCardWidget extends StatelessWidget {
  const PaymentWayCardWidget({
    super.key,
    this.onTap,
    required this.groupValue,
    required this.onChanged,
    required this.value,
    this.paymentMethod,
  });
  final void Function()? onTap;
  final String groupValue;
  final void Function(String? value) onChanged;
  final String value;
  final PaymentMethodModelUi? paymentMethod;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: paymentMethod?.subtitle == null
          ? EdgeInsets.all(8)
          : EdgeInsets.symmetric(horizontal: 8),
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      tileColor: paymentMethod!.color,
      leading: paymentMethod!.icon,
      title: Text(paymentMethod!.title, style: TextStyle(color: Colors.white)),
      subtitle: paymentMethod?.subtitle != null
          ? Text(paymentMethod!.subtitle!)
          : null,
      trailing: CustomRadioButton(
        groupValue: groupValue,
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
