import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/constants/app_colors.dart';
import 'package:restaurant_app_sonic/core/constants/app_images.dart';
import 'package:svg_flutter/svg.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                AppImages.logoSvg,
                color: AppColors.mainColor,
                height: 40,
              ),
              SizedBox(height: 10),
              Text(
                "Hello,Wessam",
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ],
          ),
          Spacer(),
          CircleAvatar(radius: 30),
        ],
      ),
    );
  }
}
