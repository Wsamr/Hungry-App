import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

Future<void> checkInternetConnection() async {
  final bool isConnected = await InternetConnection().hasInternetAccess;
  if (!isConnected) {
    throw Exception("Check your Internet connection");
  }
}
