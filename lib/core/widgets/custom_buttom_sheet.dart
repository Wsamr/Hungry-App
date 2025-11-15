import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant_app_sonic/core/functions/picker_image.dart';
import 'package:restaurant_app_sonic/core/widgets/icon_and_text_bottom_row.dart';
import 'package:restaurant_app_sonic/features/auth/cubit/auth_cubit.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});
  Future<void> _handlePick(BuildContext context, ImageSource source) async {
    XFile? image = await pickImage(source);
    if (image != null) {
      await context.read<AuthCubit>().uploadImage(image);
    }
    Navigator.pop(context);
  }

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
              onTap: () async {
                await _handlePick(context, ImageSource.camera);
              },
            ),
            SizedBox(height: 18),
            IconAndTextBottonRow(
              iconData: Icons.photo,
              text: "Gallery",
              onTap: () async {
                await _handlePick(context, ImageSource.gallery);
              },
            ),
          ],
        ),
      ), // Your content
    );
  }
}
