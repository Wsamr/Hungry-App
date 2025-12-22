import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';
import 'package:restaurant_app_sonic/features/orders_history/presentation/cubit/order_history_cubit.dart';
import 'package:restaurant_app_sonic/features/orders_history/presentation/data/models/order_history_model.dart';
import 'package:restaurant_app_sonic/features/orders_history/presentation/views/widgets/order_header.dart';
import 'package:restaurant_app_sonic/features/orders_history/presentation/views/widgets/order_item_tile.dart';
import 'package:restaurant_app_sonic/features/orders_history/presentation/views/widgets/order_total.dart';

class OrderDetailsView extends StatefulWidget {
  const OrderDetailsView({super.key, required this.order});
  final OrderHistoryModel order;

  @override
  State<OrderDetailsView> createState() => _OrderDetailsViewState();
}

class _OrderDetailsViewState extends State<OrderDetailsView> {
  @override
  void initState() {
    super.initState();
    context.read<OrderHistoryCubit>().getOrderDetails(widget.order.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.order.id.toString()),
      ),
      body: BlocConsumer<OrderHistoryCubit, OrderhistoryState>(
        listener: (context, state) {
          if (state is OrderDetailsFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
        builder: (context, state) {
          if (state is OrderDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is OrderDetailsLoaded) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OrderHeader(order: state.order),
                  OrderTotal(total: state.order.totalPrice),
                  SizedBox(height: Screen.h * .02),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.order.items.length,
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder: (context, index) {
                      return OrderItemTile(item: state.order.items[index]);
                    },
                  ),
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
