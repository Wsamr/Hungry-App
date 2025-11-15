import 'package:flutter/material.dart';

class IconAndTextBottonRow extends StatelessWidget {
  const IconAndTextBottonRow({
    super.key,
    this.onTap,
    required this.iconData,
    required this.text,
  });
  final void Function()? onTap;
  final IconData iconData;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(children: [Icon(iconData), SizedBox(width: 10), Text(text)]),
    );
  }
}
