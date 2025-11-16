import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant_app_sonic/core/functions/picker_image.dart';
import 'package:restaurant_app_sonic/core/utils/validatior.dart';
import 'package:restaurant_app_sonic/core/widgets/custom_buttom_sheet.dart';
import 'package:restaurant_app_sonic/core/widgets/custom_button_widget.dart';
import 'package:restaurant_app_sonic/core/widgets/custom_text_form_feild_widget.dart';
import 'package:restaurant_app_sonic/features/profile/view/widgets/custom_image_box.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  FocusNode focusNode = FocusNode();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  _handledPickImage(BuildContext context, ImageSource imageSource) async {
    XFile? image = await pickImage(imageSource);
    if (image != null) {}

    Navigator.pop(context);
  }

  @override
  void dispose() {
    focusNode.dispose();
    name.dispose();
    email.dispose();
    address.dispose();
    phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  spacing: 30,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30),
                    CustomImageBox(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return CustomBottomSheet(
                              cameraOnTap: () => _handledPickImage(
                                context,
                                ImageSource.camera,
                              ),
                              galaryOnTap: () => _handledPickImage(
                                context,
                                ImageSource.gallery,
                              ),
                            );
                          },
                        );
                      },
                    ),
                    CustomTextFormFelidWidget(
                      controller: name,
                      hintText: "name",
                      textInputAction: TextInputAction.next,
                      validator: Validatior.userNameValidation,
                    ),
                    CustomTextFormFelidWidget(
                      controller: email,
                      hintText: "email",
                      textInputAction: TextInputAction.next,
                      validator: Validatior.emailValidation,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    CustomTextFormFelidWidget(
                      controller: phone,
                      hintText: "phone",
                      textInputAction: TextInputAction.next,
                      validator: Validatior.phoneValidation,
                      keyboardType: TextInputType.phone,
                    ),
                    CustomTextFormFelidWidget(
                      controller: address,
                      hintText: "address",
                      textInputAction: TextInputAction.done,
                      validator: Validatior.addressValidation,
                      keyboardType: TextInputType.streetAddress,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButtonWidget(
                title: "Edit Profile",
                size: Size(screenWidth * .45, screenHeight * .1),
                onPressed: () {},
              ),
              CustomButtonWidget(
                title: "Log out",
                size: Size(screenWidth * .45, screenHeight * .1),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
