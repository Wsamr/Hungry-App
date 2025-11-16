import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/widgets/icon_and_text_bottom_row.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key, this.cameraOnTap, this.galaryOnTap});

  final void Function()? cameraOnTap;
  final void Function()? galaryOnTap;
  @override
  Widget build(BuildContext context) {
    return TapRegion(
      onTapOutside: (_) => Navigator.of(context).pop(),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconAndTextBottonRow(
              iconData: Icons.camera,
              text: "Camera",
              onTap: cameraOnTap,
            ),
            SizedBox(height: 18),
            IconAndTextBottonRow(
              iconData: Icons.photo,
              text: "Gallery",
              onTap: galaryOnTap,
            ),
          ],
        ),
      ), // Your content
    );
  }
}
