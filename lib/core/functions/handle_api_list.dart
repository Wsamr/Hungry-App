import 'package:dartz/dartz.dart';
import 'package:restaurant_app_sonic/core/constants/api_endpoints.dart';
import 'package:restaurant_app_sonic/core/constants/error_messages.dart';
import 'package:restaurant_app_sonic/core/errors/exceptions.dart';

Future<Either<String, List<T>>> handleApiList<T>(
  Future<Map<String, dynamic>> Function() apiFun,
  T Function(Map<String, dynamic>) fromJson,
) async {
  try {
    final data = await apiFun();
    final List<Map<String, dynamic>> list = List<Map<String, dynamic>>.from(
      data[ApiKeys.data],
    );
    return right(list.map(fromJson).toList());
  } on NoInternetException {
    return left(ErrorMessages.noInternet);
  } on ServerException catch (e) {
    return left(e.errorModel.errorMassage);
  } catch (_) {
    return left(ErrorMessages.unknown);
  }
}
