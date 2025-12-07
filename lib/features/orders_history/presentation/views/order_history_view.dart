import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:restaurant_app_sonic/core/constants/app_images.dart';
import 'package:restaurant_app_sonic/core/constants/route_names.dart';
import 'package:restaurant_app_sonic/features/orders_history/presentation/cubit/order_history_cubit.dart';
import 'package:restaurant_app_sonic/features/orders_history/presentation/data/models/order_history_model.dart';

class OrderHistoryView extends StatefulWidget {
  const OrderHistoryView({super.key});

  @override
  State<OrderHistoryView> createState() => _OrderHistoryViewState();
}

class _OrderHistoryViewState extends State<OrderHistoryView> {
  List<OrderHistoryModel> orders = [];
  late final StreamSubscription<InternetStatus> _internetSubscription;
  bool disconnectFlag = false;
  bool _isFirstTime = true; // 👈 إضافة متغير جديد

  @override
  void initState() {
    super.initState();

    // 1. أول شيء: نبدأ الـ Stream
    _internetSubscription = InternetConnection().onStatusChange.listen((
      status,
    ) {
      _handleConnectionChange(status);
    });

    // 2. بعدين نشوف الحالة الحالية
    _checkCurrentConnection();
  }

  // دالة خاصة بمعالجة تغيرات الاتصال
  void _handleConnectionChange(InternetStatus status) {
    if (!mounted) return;

    setState(() {
      disconnectFlag = (status == InternetStatus.disconnected);
    });

    if (status == InternetStatus.connected && !_isFirstTime) {
      // لو النت رجع بعد ما كان مقطوع، نعمل ريكوست
      context.read<OrderHistoryCubit>().getOrderHistory();
    }

    _isFirstTime = false; // بعد أول مرة مش أول مرة
  }

  Future<void> _checkCurrentConnection() async {
    final hasInternet = await InternetConnection().hasInternetAccess;

    if (mounted) {
      setState(() {
        disconnectFlag = !hasInternet;
      });

      if (hasInternet) {
        context.read<OrderHistoryCubit>().getOrderHistory();
      }
    }
  }

  @override
  void dispose() {
    _internetSubscription.cancel();
    super.dispose();
  }

  _buildBlocBody() {
    return BlocBuilder<OrderHistoryCubit, OrderhistoryState>(
      builder: (context, state) {
        if (state is OrderHistoryLoading) {
          return _loadingWidget();
        }
        if (state is OrderHistoryFailure) {
          return _failureWidget(state.errorMessage);
        }
        if (state is OrderHistoryLoaded) {
          orders = state.orders;
          return orders.isEmpty
              ? Center(child: Image.asset(AppImages.noOrdersImage, height: 230))
              : _orderHistoryBody(orders);
        }
        return const Center(child: Text("No data available"));
      },
    );
  }

  _loadingWidget() {
    return const Center(child: CircularProgressIndicator());
  }

  _failureWidget(String error) {
    return Center(child: Text(error));
  }

  _orderHistoryBody(List<OrderHistoryModel> orders) {
    return SafeArea(
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return OrderHistoryCard(order: orders[index]);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 20);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: disconnectFlag
          ? const Center(child: Text("Check Your Connection")) // 👈 لما مفيش نت
          : _buildBlocBody(), // 👈 لما النت موجود
    );
  }
}

class OrderHistoryCard extends StatelessWidget {
  const OrderHistoryCard({super.key, required this.order});
  final OrderHistoryModel order;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        RouteNames.orderDetaisView,
        arguments: order,
      ),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              order.productImage == null || order.productImage!.isEmpty
                  ? Image.asset(AppImages.buragerImg, height: 140)
                  : Hero(
                      tag: order.id,
                      child: FadeInImage.assetNetwork(
                        height: 140,
                        placeholder: AppImages.sandyLoading_,
                        image: order.productImage!,
                      ),
                    ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(order.status, style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 8),
                  Text(order.totalPrice, style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 8),
                  Text(order.createdAt, style: const TextStyle(fontSize: 18)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
