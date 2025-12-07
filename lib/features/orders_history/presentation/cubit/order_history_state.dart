// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'order_history_cubit.dart';

@immutable
abstract class OrderhistoryState {}

class OrderHistoryInitial extends OrderhistoryState {}

class OrderHistoryLoading extends OrderhistoryState {}

class OrderHistoryLoaded extends OrderhistoryState {
  final List<OrderHistoryModel> orders;
  OrderHistoryLoaded({required this.orders});
}

class OrderHistoryFailure extends OrderhistoryState {
  final String errorMessage;
  OrderHistoryFailure({required this.errorMessage});
}

class OrderDetailsLoading extends OrderhistoryState {}

class OrderDetailsLoaded extends OrderhistoryState {
  final OrderDetailsModel order;
  OrderDetailsLoaded({required this.order});
}

class OrderDetailsFailure extends OrderhistoryState {
  final String errorMessage;
  OrderDetailsFailure({required this.errorMessage});
}
