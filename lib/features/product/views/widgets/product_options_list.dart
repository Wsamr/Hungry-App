import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app_sonic/core/models/option_model.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';
import 'package:restaurant_app_sonic/features/product/logic/addtocart_cubit/product_selection_cubit.dart';
import 'package:restaurant_app_sonic/features/product/views/widgets/product_option_item_widget.dart';

class ProductOptionsList extends StatelessWidget {
  ProductOptionsList({
    super.key,
    required this.options,

    required this.isToppingList,
  });
  final List<OptionModel> options;
  bool isToppingList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Screen.h * .18,
      child: ListView.separated(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: options.length,
        itemBuilder: (context, index) {
          return BlocBuilder<ProductSelectionCubit, ProductSelectionState>(
            builder: (context, state) {
              final cubit = context.read<ProductSelectionCubit>();
              return ProductOptionItemWidget(
                optionModel: options[index],
                isSelected: isToppingList
                    ? state.toppingsIds.contains(options[index].id)
                    : state.sideOptonsIds.contains(options[index].id),
                addOption: () {
                  isToppingList
                      ? cubit.toggleTopping(options[index].id)
                      : cubit.toggleSideOption(options[index].id);
                },
              );
            },
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: Screen.w * .05);
        },
      ),
    );
  }
}
