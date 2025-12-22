import 'package:restaurant_app_sonic/core/constants/app_images.dart';
import 'package:restaurant_app_sonic/features/home/data/models/product_model.dart';
import 'package:restaurant_app_sonic/features/home/view/models/user_header_model.dart';

// List<ProductModel> products = [
//   ProductModel(
//     id: 1,
//     image: AppImages.testImage,
//     name: "Cheeseburger",
//     description: "Wendy's Burger",
//     rate: "4.9",
//     price: "",
//   ),
//   ProductModel(
//     id: 1,
//     image: AppImages.buragerImg,
//     name: "Cheeseburger",
//     description: "Wendy's Burger",
//     rate: "4.9",
//     price: "",
//   ),
//   ProductModel(
//     id: 1,
//     image: AppImages.buragerImg,
//     name: "Cheeseburger",
//     description: "Wendy's Burger",
//     rate: "4.9",
//     price: "",
//   ),
//   ProductModel(
//     id: 1,
//     image: AppImages.testImage,
//     name: "Cheeseburger",
//     description: "Wendy's Burger",
//     rate: "4.9",
//     price: "",
//   ),
//   ProductModel(
//     id: 1,
//     image: AppImages.buragerImg,
//     name: "Cheeseburger",
//     description: "Wendy's Burger",
//     rate: "4.9",
//     price: "",
//   ),
// ];

final List<String> fakeCategory = const [
  "All",
  'Combos',
  "Sliders",
  "Calssic",
  'Combos',
  "Sliders",
  "Calssic",
];

final UserHeaderModel user = UserHeaderModel(
  name: "Wessam",
  imagePath: AppImages.networkProfleImage,
);
