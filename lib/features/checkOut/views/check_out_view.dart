import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/constants/app_images.dart';
import 'package:restaurant_app_sonic/core/constants/app_strings.dart';
import 'package:restaurant_app_sonic/core/utils/res_text_size.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';
import 'package:restaurant_app_sonic/core/widgets/custom_success_alert_dialog.dart';
import 'package:restaurant_app_sonic/features/checkOut/models/payment_method_type.dart';
import 'package:restaurant_app_sonic/features/checkOut/models/payment_method_model_ui.dart';
import 'package:restaurant_app_sonic/features/checkOut/views/widgets/payment_methods_list.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:restaurant_app_sonic/core/constants/app_icons.dart';
import 'package:restaurant_app_sonic/core/widgets/bottom_salary_container.dart';
import 'package:restaurant_app_sonic/features/checkOut/views/widgets/order_details_widget.dart';

class CheckOutView extends StatelessWidget {
  CheckOutView({super.key, required this.totalPrice});
  final String totalPrice;

  ValueNotifier<PaymentMethodType> paymentWayNotifier = ValueNotifier(
    PaymentMethodType.cash,
  );

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
                order: totalPrice,
                taxes: "0.3",
                deliveryFees: "1.5",
                total: (double.parse(totalPrice) + .3 + 1.5).toString(),
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
      bottomNavigationBar: BottomSlaryContainer(
        salary: (double.parse(totalPrice) + .3 + 1.5).toString(),
        isLoading: false,
        buttonName: AppStrings.checkOut,
        onTap: () => showDialog(
          context: context,
          builder: (context) {
            return CustomAlertDialog(
              imagePath: AppIcons.sucessIcon,
              title: AppStrings.success,
              subTitle: AppStrings.yourPaymentWasSucessP,
              onPressed: () {},
            );
          },
        ),
      ),
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
