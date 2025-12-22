import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';
import 'package:restaurant_app_sonic/core/widgets/custom_button_widget.dart';

class ActionsProfileArea extends StatelessWidget {
  const ActionsProfileArea({super.key, this.editOnTap, this.logOutOnTap});

  final void Function()? editOnTap;
  final void Function()? logOutOnTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomButtonWidget(
            title: "Edit Profile",
            size: Size(Screen.w * .45, Screen.h * .1),
            onPressed: editOnTap,
          ),
          CustomButtonWidget(
            title: "Log out",
            size: Size(Screen.w * .45, Screen.h * .1),
            onPressed: logOutOnTap,
          ),
        ],
      ),
    );
  }
}
