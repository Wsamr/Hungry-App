import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/features/home/view/widgets/category_container.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({
    super.key,
    required this.widthScreen,
    required this.heightScreen,
    required this.category,
  });
  final double widthScreen;
  final double heightScreen;
  final List<String> category;

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  final ValueNotifier<int> selectedItemNotifer = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.heightScreen * .055,
      child: ValueListenableBuilder(
        valueListenable: selectedItemNotifer,
        builder: (context, value, child) {
          return ListView.builder(
            padding: EdgeInsets.only(left: widget.widthScreen * .04),
            scrollDirection: Axis.horizontal,
            itemCount: widget.category.length,
            itemBuilder: (context, index) {
              return CategoryContainer(
                onTap: () {
                  selectedItemNotifer.value = index;
                },
                isSelected: selectedItemNotifer.value == index,
                widthScreen: widget.widthScreen,
                heightScreen: widget.heightScreen,
                category: widget.category[index],
              );
            },
          );
        },
      ),
    );
  }
}
