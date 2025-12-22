import 'package:dartz/dartz.dart';
import 'package:restaurant_app_sonic/core/constants/error_messages.dart';
import 'package:restaurant_app_sonic/core/errors/exceptions.dart';
import 'package:restaurant_app_sonic/core/functions/handle_api_list.dart';
import 'package:restaurant_app_sonic/core/models/option_model.dart';
import 'package:restaurant_app_sonic/features/product/data/models/add_to_cart_model.dart';
import 'package:restaurant_app_sonic/features/product/data/web/product_web_service.dart';

abstract class ProductRepo {
  Future<Either<String, List<OptionModel>>> getToppings();
  Future<Either<String, List<OptionModel>>> getSideOptions();
  Future<Either<String, Unit>> addToCart(AddToCartModel req);
}

class ProductRepoImple extends ProductRepo {
  final ProductWebService productWebService;
  ProductRepoImple({required this.productWebService});

  @override
  Future<Either<String, List<OptionModel>>> getToppings() async =>
      handleApiList(
        productWebService.getToppings,
        (topping) => OptionModel.fromJson(topping),
      );

  @override
  Future<Either<String, List<OptionModel>>> getSideOptions() async =>
      handleApiList(
        productWebService.getSideOptions,
        (sideOption) => OptionModel.fromJson(sideOption),
      );

  @override
  Future<Either<String, Unit>> addToCart(AddToCartModel req) async {
    try {
      final data = await productWebService.addToCart(req);
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
