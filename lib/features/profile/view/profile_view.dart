import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant_app_sonic/core/cached/cache_helper.dart';
import 'package:restaurant_app_sonic/core/constants/app_images.dart';
import 'package:restaurant_app_sonic/core/functions/picker_image.dart';
import 'package:restaurant_app_sonic/core/service/service_locator.dart';
import 'package:restaurant_app_sonic/core/utils/validatior.dart';
import 'package:restaurant_app_sonic/core/widgets/custom_buttom_sheet.dart';
import 'package:restaurant_app_sonic/core/widgets/custom_button_widget.dart';
import 'package:restaurant_app_sonic/core/widgets/custom_text_form_feild_widget.dart';
import 'package:restaurant_app_sonic/features/checkOut/models/payment_method_model_ui.dart';
import 'package:restaurant_app_sonic/features/checkOut/models/payment_method_type.dart';
import 'package:restaurant_app_sonic/features/checkOut/views/widgets/payment_way_card_widget.dart';
import 'package:restaurant_app_sonic/features/profile/cubit/profile_cubit.dart';
import 'package:restaurant_app_sonic/features/profile/data/model/update_profile_model.dart';
import 'package:restaurant_app_sonic/features/profile/view/widgets/custom_image_box.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView>
    with AutomaticKeepAliveClientMixin {
  FocusNode focusNode = FocusNode();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  XFile? image;
  _handledPickImage(BuildContext context, ImageSource imageSource) async {
    image = await pickImage(imageSource);
    if (image != null) {
      await context.read<ProfileCubit>().uploadingImage(image);
    }

    Navigator.pop(context);
  }

  ImageProvider _buildProfileImage() {
    final cubit = context.read<ProfileCubit>();
    final imageFile = cubit.imagePic;
    final imageUrl = cubit.user?.profileDataModel?.image;
    if (imageFile != null) {
      return FileImage(File(imageFile.path));
    } else if (imageUrl != null) {
      return NetworkImage(imageUrl);
    } else {
      return AssetImage(AppImages.buragerImg);
    }
  }

  @override
  void initState() {
    super.initState();
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
    super.build(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BlocConsumer<ProfileCubit, ProfileState>(
              listener: (context, state) {
                if (state is ProfileInfoSuccess) {
                  name.text = state.user.profileDataModel!.name;
                  email.text = state.user.profileDataModel!.email;
                  address.text =
                      state.user.profileDataModel?.address ?? "address";
                }
                if (state is UpdateProfileSuccess) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Container();
                    },
                  );
                }
                if (state is LogOutSuccess) {
                  sl<CacheHelper>().clearData();
                }
              },
              builder: (context, state) {
                if (state is ProfileInfoLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                return Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      spacing: 30,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        CustomImageBox(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          image: _buildProfileImage(),
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (inner) {
                                return BlocProvider.value(
                                  value: BlocProvider.of<ProfileCubit>(
                                    context,
                                    listen: false,
                                  ),
                                  child: CustomBottomSheet(
                                    cameraOnTap: () => _handledPickImage(
                                      context,
                                      ImageSource.camera,
                                    ),
                                    galaryOnTap: () => _handledPickImage(
                                      context,
                                      ImageSource.gallery,
                                    ),
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
                          controller: address,
                          hintText: "address",
                          textInputAction: TextInputAction.done,
                          validator: Validatior.addressValidation,
                          keyboardType: TextInputType.streetAddress,
                        ),
                        PaymentWayCardWidget(
                          groupValue: "visa",
                          onChanged: (value) {},
                          value: "visa",
                          paymentMethod: PaymentMethodModelUi(
                            type: PaymentMethodType.visa,
                            title: "Debit card",
                            color: Colors.green,
                            icon: Image.asset(AppImages.visaImage),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
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
                onPressed: () {
                  // context.read<ProfileCubit>().updateProfile(
                  //   UpdateProfileModel(
                  //     name: name.text,
                  //     email: email.text,
                  //     address: address.text,
                  //   ),
                  // );
                },
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
