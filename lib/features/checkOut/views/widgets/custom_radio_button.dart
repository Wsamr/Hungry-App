import 'package:flutter/material.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({
    super.key,
    required this.groupValue,
    required this.onChanged,
    required this.value,
  });
  final String groupValue;
  final void Function(String? value) onChanged;
  final String value;
  @override
  Widget build(BuildContext context) {
    return RadioGroup<String>(
      groupValue: groupValue,
      onChanged: onChanged,
      child: Radio<String>(value: value, activeColor: Colors.white),
    );
  }
}
