import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/widgets/custom_text_form_feild_widget.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key, this.controller});
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(13),
        shadowColor: Colors.black26,
        elevation: 8,
        child: CustomTextFormFelidWidget(
          controller: controller,
          prefixIcon: Icon(Icons.search),
          hintText: "Search",
          fillColor: Colors.white,
          widthBorder: 0,
        ),
      ),
    );
  }
}
