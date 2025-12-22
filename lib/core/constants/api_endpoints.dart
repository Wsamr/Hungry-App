abstract class ApiEndpoints {
  static const String baseUrl = "https://sonic-zdi0.onrender.com/api";

  //auth endPoints
  static const String loginEndPoint = "/login";
  static const String registerEndPoint = "/register";

  // order history

  static const String ordersHistory = "/orders";
  static const String orderHistoryDetail = "/orders/";
  // profile
  static const String getProfileEndPoint = "/profile";
  static const String updateProfileEndPoint = "/update-profile";
  static const String logoutEndPoint = "/logout";
  static const String categoriesEndPoint = "/categories";
  static const String productsEndPoint = "/products";
  static const String toppingsEndPoint = "/toppings";
  static const String sideOptionsEndPoint = "/side-options";
  static const String addToCartEndPoint = "/cart/add";
  static const String getCartEndPoint = "/cart";
  static const String productsByCategoryEndPoint = "/products?category_id=";
}

abstract class ApiKeys {
  static const String accept = "Accept";
  static const String applicationJson = "application/json";
  static const String message = "message";
  static const String authorization = "Authorization";

  static const String data = "data";
  static const String id = "id";
  static const String status = "status";
  static const String totalPrice = "total_price";
  static const String createdAt = "created_at";
  static const String productImage = "product_image";
  static const String description = "description";
  static const String rating = "rating";

  static const String items = "items";
  static const String productId = "product_id";
  static const String name = "name";
  static const String image = "image";
  static const String quantity = "quantity";
  static const String price = "price";
  static const String spicy = "spicy";
  static const String toppings = "toppings";
  static const String sideOptions = "side_options";
}
