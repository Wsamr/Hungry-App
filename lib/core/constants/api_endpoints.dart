abstract class ApiEndpoints {
  static const String baseUrl = "https://sonic-zdi0.onrender.com/api";

  //auth endPoints
  static const String loginEndPoint = "/login";
  static const String registerEndPoint = "/register";

  // profile
  static const String getProfileEndPoint = "/profile";
  static const String updateProfileEndPoint = "/update-profile";
  static const String logoutEndPoint = "/logout";
}

abstract class ApiKeys {
  static const String accept = "Accept";
  static const String applicationJson = "application/json";
  static const String message = "message";
  static const String authorization = "Authorization";
}
