import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:restaurant_app_sonic/core/errors/exceptions.dart';

Future<void> checkInternetConnection() async {
  final bool isConnected = await InternetConnection().hasInternetAccess;
  if (!isConnected) {
    throw NoInternetException();
  }
}
