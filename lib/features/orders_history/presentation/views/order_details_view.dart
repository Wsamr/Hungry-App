import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app_sonic/features/orders_history/presentation/cubit/order_history_cubit.dart';
import 'package:restaurant_app_sonic/features/orders_history/presentation/data/models/order_history_model.dart';

class OrderDetailsView extends StatefulWidget {
  const OrderDetailsView({super.key, required this.order});
  final OrderHistoryModel order;

  @override
  State<OrderDetailsView> createState() => _OrderDetailsViewState();
}

class _OrderDetailsViewState extends State<OrderDetailsView> {
  @override
  void initState() {
    BlocProvider.of<OrderHistoryCubit>(
      context,
    ).getOrderDetails(widget.order.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: widget.order.id,
                child: Image.network(
                  widget.order.productImage!,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                children: [
                  Text("status : ", style: TextStyle(fontSize: 18)),
                  Text(widget.order.status, style: TextStyle(fontSize: 18)),
                ],
              ),
              Row(
                children: [
                  Text("total Price : ", style: TextStyle(fontSize: 18)),
                  Text(widget.order.totalPrice, style: TextStyle(fontSize: 18)),
                ],
              ),
              Row(
                children: [
                  Text("created At : ", style: TextStyle(fontSize: 18)),
                  Text(widget.order.createdAt, style: TextStyle(fontSize: 18)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
