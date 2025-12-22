import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app_sonic/core/constants/app_colors.dart';
import 'package:restaurant_app_sonic/core/constants/app_icons.dart';
import 'package:restaurant_app_sonic/core/constants/app_images.dart';
import 'package:restaurant_app_sonic/core/constants/app_strings.dart';
import 'package:restaurant_app_sonic/core/constants/error_messages.dart';
import 'package:restaurant_app_sonic/core/models/option_model.dart';
import 'package:restaurant_app_sonic/core/utils/res_text_size.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';
import 'package:restaurant_app_sonic/core/widgets/bottom_salary_container.dart';
import 'package:restaurant_app_sonic/core/widgets/custom_success_alert_dialog.dart';
import 'package:restaurant_app_sonic/features/home/data/models/product_model.dart';
import 'package:restaurant_app_sonic/features/product/logic/addtocart_cubit/product_selection_cubit.dart';
import 'package:restaurant_app_sonic/features/product/logic/options_cubit/product_options_cubit.dart';
import 'package:restaurant_app_sonic/features/product/views/widgets/product_customization_section.dart';
import 'package:restaurant_app_sonic/features/product/views/widgets/product_options_section.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    Screen.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          product.name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Screen.w * .04,
                vertical: Screen.h * .01,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(80),
                ),
              ),
              child: AspectRatio(
                aspectRatio: 3 / 2,
                child: Hero(
                  tag: product.id,
                  child: FadeInImage.assetNetwork(
                    fit: BoxFit.contain,
                    placeholder: AppImages.sandyLoading_,
                    image: product.image ?? AppImages.sandyLoading_,
                  ),
                ),
              ),
            ),
            SizedBox(height: Screen.h * .02),
            Padding(
              padding: EdgeInsets.only(left: Screen.w * .04),
              child: Text(
                AppStrings.description,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: ResTextSize.getResFontSize(context, fontSize: 26),
                ),
              ),
            ),
            SizedBox(height: Screen.h * .02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Screen.w * .04),
              child: Text(
                product.description,
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: Screen.h * .02),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                AppStrings.customization,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: ResTextSize.getResFontSize(context, fontSize: 26),
                ),
              ),
            ),
            ProductCustomizationSection(),
            SizedBox(height: Screen.h * .02),
            BlocBuilder<ProductOptionsCubit, OptionsState>(
              builder: (context, state) {
                final cubit = context.read<ProductSelectionCubit>();
                if (state is OptionsSuccess) {
                  return optionsBody(state.toppings, state.sideOptions);
                } else if (state is OptionsFailure) {
                  return Center(child: Text(state.errorMessage));
                } else if (state is OptionsLoading) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
            SizedBox(height: Screen.h * .24),
          ],
        ),
      ),
      bottomSheet: _addToCartBodyBloc(),
    );
  }

  BlocConsumer<ProductSelectionCubit, ProductSelectionState>
  _addToCartBodyBloc() {
    return BlocConsumer<ProductSelectionCubit, ProductSelectionState>(
      listener: (context, state) {
        if (state.status == AddToCartStatus.success) {
          showDialog(
            context: context,
            builder: (context) => CustomAlertDialog(
              title: "sucess, go to cart to see",
              imagePath: AppIcons.sucessIcon,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ).then((_) {
            context.read<ProductSelectionCubit>().resetStatus();
          });
        }
        if (state.status == AddToCartStatus.failure) {
          showDialog(
            context: context,
            builder: (context) => CustomAlertDialog(
              title: state.errorMessage ?? ErrorMessages.unknown,
              imagePath: AppIcons.failureIcon,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ).then((_) {
            context.read<ProductSelectionCubit>().resetStatus();
          });
        }
      },
      builder: (context, state) {
        final cubit = context.read<ProductSelectionCubit>();

        return BottomSlaryContainer(
          isLoading: state.status == AddToCartStatus.loading,
          salary: product.price + " +",
          onTap: () async {
            await cubit.addTocart();
          },
        );
      },
    );
  }
}

Widget optionsBody(List<OptionModel> toppings, List<OptionModel> sideOptions) {
  return Column(
    children: [
      ProductOptionsSection(
        optionTitle: "Toppings",
        options: toppings,
        isToppingList: true,
      ),
      ProductOptionsSection(
        optionTitle: "Side options",
        options: sideOptions,
        isToppingList: false,
      ),
    ],
  );
}
