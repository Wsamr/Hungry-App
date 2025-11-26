import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/features/checkOut/models/payment_method_type.dart';

class PaymentMethodModelUi {
  final PaymentMethodType type;
  final String title;
  final String? subtitle;
  final Color color;
  final Widget icon;
  PaymentMethodModelUi({
    required this.type,
    required this.title,
    this.subtitle,
    required this.color,
    required this.icon,
  });
}
