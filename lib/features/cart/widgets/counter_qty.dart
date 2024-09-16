import 'package:bbmobile/utils/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/counter_qty_cubit.dart';

class CounterQty extends StatelessWidget {
  final Function(int) onQtyChanged;
  final int initialQty;
  final bool isTransactionDetail;

  const CounterQty({
    super.key,
    required this.onQtyChanged,
    this.initialQty = 1,
    this.isTransactionDetail = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterQtyCubit()
        ..initialQty(
          qty: initialQty,
        ),
      child: BlocConsumer<CounterQtyCubit, CounterQtyState>(
        listener: (context, state) {
          state.when(
            qty: (qty) {
              onQtyChanged(qty);
            },
          );
        },
        builder: (context, state) {
          if (isTransactionDetail) {
            return state.when(
              qty: (qty) => Text(
                'x $qty',
                style: const TextStyle(
                  fontSize: 12,
                  fontFamily: FontFamily.poppins,
                  fontWeight: FontWeight.w700,
                ),
              ),
            );
          }

          return Row(
            children: [
              IconButton(
                onPressed: () {
                  context.read<CounterQtyCubit>().minQty(
                        qty: context.read<CounterQtyCubit>().qtyValue,
                      );
                },
                icon: const Icon(
                  Icons.remove_circle,
                  size: 18,
                  color: Colors.black,
                ),
              ),
              state.when(
                qty: (qty) => Text(
                  qty.toString(),
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: FontFamily.poppins,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  context.read<CounterQtyCubit>().addQty(
                        qty: context.read<CounterQtyCubit>().qtyValue,
                      );
                },
                icon: const Icon(
                  Icons.add_circle,
                  size: 18,
                  color: Colors.black,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
