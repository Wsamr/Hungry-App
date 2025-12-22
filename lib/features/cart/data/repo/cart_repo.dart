// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:restaurant_app_sonic/core/constants/api_endpoints.dart';
import 'package:restaurant_app_sonic/core/constants/error_messages.dart';
import 'package:restaurant_app_sonic/core/errors/exceptions.dart';

import 'package:restaurant_app_sonic/features/cart/data/models/cart_response_model.dart';
import 'package:restaurant_app_sonic/features/cart/data/web/cart_web_service.dart';

abstract class CartRepo {
  Future<Either<String, CartResponseModel>> getCartData();
  Future<Either<String, Unit>> removeCartItem(int cartItemId);
}

class CartRepoImple extends CartRepo {
  final CartWebService cartWebService;
  CartRepoImple({required this.cartWebService});
  @override
  Future<Either<String, CartResponseModel>> getCartData() async {
    try {
      final data = await cartWebService.getCartData();
      return right(CartResponseModel.fromJson(data[ApiKeys.data]));
    } on NoInternetException {
      return left(ErrorMessages.noInternet);
    } on ServerException catch (e) {
      return left(e.errorModel.errorMassage);
    } catch (_) {
      return left(ErrorMessages.unknown);
    }
  }

  @override
  Future<Either<String, Unit>> removeCartItem(int cartItemId) async {
    try {
      final data = await cartWebService.removeCartItem(cartItemId);
      return right(unit);
    } on NoInternetException {
      return left(ErrorMessages.noInternet);
    } on ServerException catch (e) {
      return left(e.errorModel.errorMassage);
    } catch (_) {
      return left(ErrorMessages.unknown);
    }
  }
}
