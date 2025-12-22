import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';
import 'package:restaurant_app_sonic/features/home/data/models/category_model.dart';
import 'package:restaurant_app_sonic/features/home/view/widgets/category_container.dart';

class CategoriesList extends StatelessWidget {
  CategoriesList({
    super.key,
    required this.category,
    required this.selectedItemNotifer,
    required this.id,
  });
  final List<CategoryModel> category;
  final ValueNotifier<int> selectedItemNotifer;
  Function(int id) id;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Screen.h * .055,
      child: ValueListenableBuilder(
        valueListenable: selectedItemNotifer,
        builder: (context, value, child) {
          return ListView.builder(
            padding: EdgeInsets.only(left: Screen.w * .04),
            scrollDirection: Axis.horizontal,
            itemCount: category.length,
            itemBuilder: (context, index) {
              return CategoryContainer(
                onTap: () {
                  selectedItemNotifer.value = index;
                  id(category[index].id);
                },
                isSelected: selectedItemNotifer.value == index,
                category: category[index].name,
              );
            },
          );
        },
      ),
    );
  }
}
