import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app_sonic/core/constants/app_icons.dart';
import 'package:restaurant_app_sonic/core/constants/app_images.dart';
import 'package:restaurant_app_sonic/core/constants/app_strings.dart';
import 'package:restaurant_app_sonic/core/constants/route_names.dart';
import 'package:restaurant_app_sonic/core/utils/res_text_size.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';
import 'package:restaurant_app_sonic/core/widgets/custom_success_alert_dialog.dart';
import 'package:restaurant_app_sonic/core/widgets/bottom_salary_container.dart';
import 'package:restaurant_app_sonic/features/cart/cart_cubit/cart_cubit.dart';
import 'package:restaurant_app_sonic/features/cart/data/models/cart_item_model.dart';
import 'package:restaurant_app_sonic/features/checkOut/cubit/check_out_cubit.dart';
import 'package:restaurant_app_sonic/features/checkOut/cubit/check_out_state.dart';
import 'package:restaurant_app_sonic/features/checkOut/models/payment_method_type.dart';
import 'package:restaurant_app_sonic/features/checkOut/models/payment_method_model_ui.dart';
import 'package:restaurant_app_sonic/features/checkOut/views/widgets/order_details_widget.dart';
import 'package:restaurant_app_sonic/features/checkOut/views/widgets/payment_methods_list.dart';
import 'package:svg_flutter/svg_flutter.dart';

class CheckOutView extends StatefulWidget {
  final String totalPrice;
  CheckOutView({super.key, required this.totalPrice});

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  final ValueNotifier<PaymentMethodType> paymentWayNotifier = ValueNotifier(
    PaymentMethodType.cash,
  );
  @override
  void initState() {
    context.read<CartCubit>().getCartData();
    super.initState();
  }

  final List<PaymentMethodModelUi> paymentMethods = [
    PaymentMethodModelUi(
      type: PaymentMethodType.cash,
      title: AppStrings.cashOnDelivery,
      color: Color(0xff3C2F2F),
      icon: SvgPicture.asset(AppIcons.commentIcon),
    ),
    PaymentMethodModelUi(
      type: PaymentMethodType.visa,
      title: AppStrings.debitCard,
      color: Colors.green,
      icon: Image.asset(AppImages.visaImage),
      subtitle: "3566 **** **** 0505",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckOutCubit, CheckOutState>(
      listener: (context, state) {
        if (state is CheckOutSuccess) {
          showDialog(
            context: context,
            builder: (context) => CustomAlertDialog(
              title: AppStrings.success,
              imagePath: AppIcons.sucessIcon,
              onPressed: () {
                context.read<CartCubit>().clearCart();
                Navigator.pop(context);
                Navigator.pushReplacementNamed(
                  context,
                  RouteNames.bottomNavWidget,
                );
              },
            ),
          );
        } else if (state is CheckOutFailure) {
          showDialog(
            context: context,
            builder: (context) => CustomAlertDialog(
              title: "Failed",
              imagePath: AppIcons.failureIcon,
              onPressed: () => Navigator.pop(context),
            ),
          );
        }
      },
      builder: (context, state) {
        final total = (double.parse(widget.totalPrice) + 0.3 + 1.5).toString();
        final isLoading = state is CheckOutLoading;

        return Scaffold(
          appBar: AppBar(backgroundColor: Colors.white),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: Screen.w * .04),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Screen.h * .02),
                  OrderDetailsWidget(
                    order: widget.totalPrice,
                    taxes: "0.3",
                    deliveryFees: "1.5",
                    total: total,
                  ),
                  SizedBox(height: Screen.h * .05),
                  mainText(context, AppStrings.paymentMethods),
                  SizedBox(height: Screen.h * .03),
                  ValueListenableBuilder(
                    valueListenable: paymentWayNotifier,
                    builder: (context, value, child) {
                      return PaymentMethodsList(
                        paymentMethods: paymentMethods,
                        paymentWayNotifier: paymentWayNotifier,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BlocBuilder<CartCubit, CartState>(
            builder: (context, cartState) {
              final isCartReady =
                  cartState.status == CartStatus.success &&
                  cartState.cartItems.isNotEmpty;

              final isButtonDisabled = !isCartReady || isLoading;

              return BottomSalaryContainer(
                salary: total,
                isLoading: isLoading,
                buttonName: AppStrings.checkOut,
                onTap: isButtonDisabled
                    ? null
                    : () {
                        context.read<CheckOutCubit>().saveOrder(
                          List.from(cartState.cartItems),
                        );
                      },
              );
            },
          ),
        );
      },
    );
  }
}

Text mainText(BuildContext context, String title) {
  return Text(
    title,
    style: TextStyle(
      fontSize: ResTextSize.getResFontSize(context, fontSize: 20),
      fontWeight: FontWeight.w700,
    ),
  );
}
