import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app_sonic/core/constants/route_names.dart';
import 'package:restaurant_app_sonic/core/utils/validatior.dart';
import 'package:restaurant_app_sonic/core/widgets/custom_button_widget.dart';
import 'package:restaurant_app_sonic/core/widgets/custom_text_form_feild_widget.dart';
import 'package:restaurant_app_sonic/features/auth/view/widgets/custom_auth_rich_text_widget.dart';
import 'package:restaurant_app_sonic/features/auth/view/widgets/custom_text_widget.dart';
import 'package:restaurant_app_sonic/features/auth/cubit/auth_cubit.dart';
import 'package:restaurant_app_sonic/features/auth/data/models/login_models/login_request_model.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    ValueNotifier isHidenPassword = ValueNotifier(true);
    final keyForm = GlobalKey<FormState>();
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("lodding")));
        }
        if (state is LoginFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
        if (state is LoginSuccess) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            RouteNames.bottomNavWidget,
            (route) => false,
          );
        }
      },
      child: Form(
        key: keyForm,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(title: "SIGN IN"),
            SizedBox(height: size.height * .05),
            CustomTextFormFelidWidget(
              hintText: "Email ...",
              controller: emailController,
              prefixIcon: Icon(Icons.person_2_outlined),
              validator: Validatior.emailValidation,
            ),
            SizedBox(height: size.height * .04),
            ValueListenableBuilder(
              valueListenable: isHidenPassword,
              builder: (context, value, child) {
                return CustomTextFormFelidWidget(
                  hintText: "Password ...",
                  controller: passwordController,
                  obscureText: value,
                  validator: Validatior.passwordValidation,
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
            SizedBox(height: size.height * .07),
            CustomButtonWidget(
              onPressed: () async {
                if (keyForm.currentState!.validate()) {
                  await context.read<AuthCubit>().login(
                    LoginRequestModel(
                      email: emailController.text,
                      password: passwordController.text,
                    ),
                  );
                }
              },
              title: "Login",
              size: Size(size.width, size.height * .07),
            ),
            SizedBox(height: size.height * .03),
            CustomAuthRichTextWidget(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.resgisterView);
              },
              hyperText: "SIGN Up",
              mainText: "Don`t Have Account ? ",
            ),
          ],
        ),
      ),
    );
  }
}
