part of 'check_out_cubit.dart';

abstract class CheckOutState extends Equatable {
  const CheckOutState();

  @override
  List<Object?> get props => [];
}

class CheckOutInitial extends CheckOutState {}

class CheckOutLoading extends CheckOutState {}

class CheckOutSuccess extends CheckOutState {
  const CheckOutSuccess();

  @override
  List<Object?> get props => [];
}

class CheckOutFailure extends CheckOutState {
  final String errorMessage;
  const CheckOutFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
