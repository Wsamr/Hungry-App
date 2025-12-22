import 'package:dartz/dartz.dart';
import 'package:restaurant_app_sonic/core/constants/error_messages.dart';
import 'package:restaurant_app_sonic/core/errors/exceptions.dart';
import 'package:restaurant_app_sonic/features/checkOut/data/check_out_web_service.dart';
import 'package:restaurant_app_sonic/features/product/data/models/add_to_cart_model.dart';

abstract class CheckOutRepo {
  Future<Either<String, Unit>> saveOrder(List<AddToCartModel> orderItems);
}

class CheckOutRepoImple implements CheckOutRepo {
  final CheckOutWebService checkOutWebService;

  CheckOutRepoImple({required this.checkOutWebService});

  @override
  Future<Either<String, Unit>> saveOrder(
    List<AddToCartModel> orderItems,
  ) async {
    try {
      final response = await checkOutWebService.saveOrder(orderItems);
      return right(unit);
    } on NoInternetException {
      return left(ErrorMessages.noInternet);
    } on ServerException catch (e) {
      return left(e.errorModel.errorMassage);
    } catch (e) {
      return left(ErrorMessages.unknown);
    }
  }
}
