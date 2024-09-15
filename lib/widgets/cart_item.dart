import 'package:bbmobile/features/cart/cubits/cart_delete_cubit.dart';
import 'package:bbmobile/features/cart/cubits/transaction_post_cubit.dart';
import 'package:bbmobile/features/cart/widgets/counter_qty.dart';
import 'package:bbmobile/utils/formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/cart/data/cart.dart';

class CartItem extends StatelessWidget {
  final CartData data;

  const CartItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartDeleteCubit, CartDeleteState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0x0C005DDD),
              width: 2.0,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(6),
            ),
          ),
          child: Row(
            children: [
              Image.network(
                data.itemImage ?? "https://via.placeholder.com/55x55",
                height: 100,
                width: 90,
                fit: BoxFit.fill,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.itemName ?? '',
                        style: const TextStyle(
                          color: Color(0xFF222222),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        Formatter.currencyFormat(
                          data.itemPrice.toString(),
                        ),
                        style: TextStyle(
                          color: const Color(0xFF222222).withOpacity(0.6),
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      BlocBuilder<TransactionPostCubit, TransactionPostState>(
                        builder: (context, state) {
                          return CounterQty(
                            onQtyChanged: (qty) {
                              context.read<TransactionPostCubit>().changeQty(
                                    itemId: data.itemId!,
                                    qty: qty,
                                  );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  context.read<CartDeleteCubit>().deleteCart(
                        id: data.itemId ?? '',
                      );
                },
                icon: const Icon(
                  Icons.delete_outline_rounded,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
