import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';
import 'package:restaurant_app_sonic/features/home/view/widgets/category_container.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key, required this.category});
  final List<String> category;

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  final ValueNotifier<int> selectedItemNotifer = ValueNotifier(0);

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
            itemCount: widget.category.length,
            itemBuilder: (context, index) {
              return CategoryContainer(
                onTap: () {
                  selectedItemNotifer.value = index;
                },
                isSelected: selectedItemNotifer.value == index,
                category: widget.category[index],
              );
            },
          );
        },
      ),
    );
  }
}
