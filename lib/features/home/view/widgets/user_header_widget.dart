import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/constants/app_colors.dart';
import 'package:restaurant_app_sonic/core/constants/app_images.dart';
import 'package:restaurant_app_sonic/core/utils/res_text_size.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';
import 'package:restaurant_app_sonic/features/auth/data/models/user_model.dart';
import 'package:restaurant_app_sonic/features/home/view/models/user_header_model.dart';
import 'package:svg_flutter/svg.dart';

class UserHeaderWidget extends StatelessWidget {
  const UserHeaderWidget({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Screen.w * .04),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppImages.logoSvg,
                color: AppColors.mainColor,
                height: Screen.h * .047,
              ),
              SizedBox(height: Screen.h * .008),
              Text(
                "Hello,${user.name}",
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: ResTextSize.getResFontSize(context, fontSize: 20),
                ),
              ),
            ],
          ),
          Spacer(),
          CircleAvatar(
            radius: Screen.w * .08,
            backgroundImage: NetworkImage(user.image ?? AppImages.personImage),
          ),
        ],
      ),
    );
  }
}
