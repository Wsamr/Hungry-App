// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_app_sonic/core/errors/exceptions.dart';
import 'package:restaurant_app_sonic/features/orders_history/presentation/data/models/order_details_model.dart';
import 'package:restaurant_app_sonic/features/orders_history/presentation/data/models/order_history_model.dart';

import 'package:restaurant_app_sonic/features/orders_history/presentation/data/repo/order_history_repo.dart';

part 'order_history_state.dart';

class OrderHistoryCubit extends Cubit<OrderhistoryState> {
  OrderHistoryRepo orderHistoryRepo;
  List<OrderHistoryModel> orders = [];
  OrderHistoryCubit(this.orderHistoryRepo) : super(OrderHistoryInitial());

  getOrderHistory() async {
    try {
      emit(OrderHistoryLoading());
      orders = await orderHistoryRepo.getOrderHistory();
      emit(OrderHistoryLoaded(orders: orders));
    } on ServerException catch (e) {
      emit(OrderHistoryFailure(errorMessage: e.errorModel.errorMassage));
    } on Exception catch (e) {
      emit(OrderHistoryFailure(errorMessage: e.toString()));
    }
  }

  getOrderDetails(int id) async {
    try {
      emit(OrderDetailsLoading());
      OrderDetailsModel order = await orderHistoryRepo.getOrderDetails(id);

      emit(OrderDetailsLoaded(order: order));
    } on ServerException catch (e) {
      emit(OrderDetailsFailure(errorMessage: e.errorModel.errorMassage));
    } on Exception catch (e) {
      emit(OrderDetailsFailure(errorMessage: e.toString()));
    }
  }
}
