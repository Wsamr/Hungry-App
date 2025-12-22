import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app_sonic/core/constants/error_messages.dart';
import 'package:restaurant_app_sonic/core/models/option_model.dart';
import 'package:restaurant_app_sonic/features/product/data/repo/product_repo.dart';
part 'product_options_state.dart';

class ProductOptionsCubit extends Cubit<OptionsState> {
  ProductOptionsCubit(this.productRepo) : super(ProductInitial());
  final ProductRepo productRepo;
  List<OptionModel> toppings = [];
  List<OptionModel> sideOptions = [];

  getOptionsLists() async {
    emit(OptionsLoading());
    try {
      final results = await Future.wait([
        productRepo.getToppings(),
        productRepo.getSideOptions(),
      ]);
      final toppingsResult = results[0];
      final sideOptionsResult = results[1];
      List<String> errors = [];

      toppingsResult.fold((error) => errors.add(error), (toppings) {
        this.toppings = toppings;
      });

      sideOptionsResult.fold((error) => errors.add(error), (sideOptions) {
        this.sideOptions = sideOptions;
      });
      if (errors.isNotEmpty) {
        emit(OptionsFailure(errorMessage: errors.join(" | ")));
      } else {
        emit(OptionsSuccess(toppings: toppings, sideOptions: sideOptions));
      }
    } catch (e, st) {
      print(e);
      print(st);
      emit(OptionsFailure(errorMessage: ErrorMessages.unknown));
    }
  }
}
