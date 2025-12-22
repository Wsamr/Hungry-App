import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant_app_sonic/core/constants/app_colors.dart';
import 'package:restaurant_app_sonic/core/constants/app_images.dart';
import 'package:restaurant_app_sonic/core/constants/route_names.dart';
import 'package:restaurant_app_sonic/core/functions/convert_image_to_xfile_or_file.dart';
import 'package:restaurant_app_sonic/core/functions/picker_image.dart';
import 'package:restaurant_app_sonic/core/utils/validatior.dart';
import 'package:restaurant_app_sonic/core/widgets/custom_buttom_sheet.dart';
import 'package:restaurant_app_sonic/core/widgets/custom_button_widget.dart';
import 'package:restaurant_app_sonic/core/widgets/custom_text_form_feild_widget.dart';
import 'package:restaurant_app_sonic/features/auth/view/widgets/custom_auth_rich_text_widget.dart';
import 'package:restaurant_app_sonic/features/auth/cubit/auth_cubit.dart';
import 'package:restaurant_app_sonic/features/auth/data/models/register_models/register_request_model.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextEditingController userNameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    ValueNotifier isHidenPassword = ValueNotifier(true);
    final keyForm = GlobalKey<FormState>();
    Future<void> _handlePick(BuildContext context, ImageSource source) async {
      XFile? image = await pickImage(source);
      if (image != null) {
        await context.read<AuthCubit>().uploadImage(image);
      }
      Navigator.pop(context);
    }

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ResgisterLoading) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("lodding")));
        }
        if (state is ResgisterFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
        if (state is ResgisterSuccess) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            RouteNames.bottomNavWidget,
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: keyForm,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  context.read<AuthCubit>().image != null
                      ? CustomCircleImage(
                          size: size,
                          isFile: true,
                          filePath: context.read<AuthCubit>().image!.path,
                        )
                      : CustomCircleImage(size: size),
                  Positioned(
                    right: 2,
                    bottom: 4,
                    child: GestureDetector(
                      onTap: () async {
                        Scaffold.of(context).showBottomSheet(
                          (context) => CustomBottomSheet(
                            cameraOnTap: () =>
                                _handlePick(context, ImageSource.camera),
                            galaryOnTap: () =>
                                _handlePick(context, ImageSource.gallery),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        backgroundColor: AppColors.mainColor,
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * .02),
              CustomTextFormFelidWidget(
                hintText: "User Name ...",
                controller: userNameController,
                prefixIcon: Icon(Icons.person_2_outlined),
                validator: Validatior.userNameValidation,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: size.height * .03),
              CustomTextFormFelidWidget(
                hintText: "Email ...",
                controller: emailController,
                prefixIcon: Icon(Icons.email_outlined),
                validator: Validatior.emailValidation,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: size.height * .03),
              ValueListenableBuilder(
                valueListenable: isHidenPassword,
                builder: (context, value, child) {
                  return CustomTextFormFelidWidget(
                    hintText: "Password ...",
                    controller: passwordController,
                    validator: Validatior.passwordValidation,
                    obscureText: value,
                    textInputAction: TextInputAction.next,

                    prefixIcon: GestureDetector(
                      onTap: () {
                        isHidenPassword.value = !isHidenPassword.value;
                      },
                      child: value
                          ? Icon(Icons.lock_outline_rounded)
                          : Icon(Icons.lock_open_outlined),
                    ),
                  );
                },
              ),
              SizedBox(height: size.height * .03),
              CustomTextFormFelidWidget(
                hintText: "Phone ...",
                controller: phoneController,
                prefixIcon: Icon(Icons.phone_outlined),
                validator: Validatior.phoneValidation,
                textInputAction: TextInputAction.done,
              ),
              SizedBox(height: size.height * .03),
              CustomButtonWidget(
                onPressed: () async {
                  if (keyForm.currentState!.validate()) {
                    await context.read<AuthCubit>().register(
                      RegisterRequestModel(
                        name: userNameController.text,
                        email: emailController.text,
                        phone: phoneController.text,
                        password: passwordController.text,
                        image: context.read<AuthCubit>().image ?? null,
                      ),
                    );
                  }
                },
                title: "Register",
                size: Size(size.width, size.height * .06),
              ),
              SizedBox(height: size.height * .03),
              CustomAuthRichTextWidget(
                onTap: () {
                  Navigator.pop(context);
                },
                hyperText: "SIGN IN",
                mainText: "Already have an account ? ",
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomCircleImage extends StatelessWidget {
  CustomCircleImage({
    super.key,
    required this.size,
    this.filePath,
    this.isFile = false,
  });

  final Size size;
  final String? filePath;
  bool isFile;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.mainColor,
      radius: size.width * .15,
      child: CircleAvatar(
        radius: size.width * .14,
        backgroundImage: isFile == true
            ? FileImage(File(filePath!))
            : AssetImage(AppImages.personImage),
      ),
    );
  }
}
