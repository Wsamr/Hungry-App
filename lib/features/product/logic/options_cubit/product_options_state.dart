part of 'product_options_cubit.dart';

abstract class OptionsState extends Equatable {
  const OptionsState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends OptionsState {}

class OptionsLoading extends OptionsState {}

class OptionsSuccess extends OptionsState {
  final List<OptionModel> toppings;
  final List<OptionModel> sideOptions;
  const OptionsSuccess({required this.toppings, required this.sideOptions});
  @override
  List<Object> get props => [toppings, sideOptions];
}

class OptionsFailure extends OptionsState {
  final String errorMessage;
  const OptionsFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
