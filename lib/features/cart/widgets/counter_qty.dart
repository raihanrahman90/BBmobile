import 'package:bbmobile/utils/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/counter_qty_cubit.dart';

class CounterQty extends StatefulWidget {
  final Function(int) onQtyChanged;
  final int initialQty;

  const CounterQty({
    super.key,
    required this.onQtyChanged,
    this.initialQty = 1,
  });

  @override
  State<CounterQty> createState() => _CounterQtyState();
}

class _CounterQtyState extends State<CounterQty> {
  final _qty = TextEditingController();

  @override
  void initState() {
    super.initState();

    _qty.text = '0';
  }

  @override
  void dispose() {
    _qty.dispose;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterQtyCubit()
        ..initialQty(
          qty: widget.initialQty,
        ),
      child: BlocConsumer<CounterQtyCubit, CounterQtyState>(
        listener: (context, state) {
          state.when(
            qty: (qty) {
              widget.onQtyChanged(qty);
              _qty.text = qty.toString();
            },
          );
        },
        builder: (context, state) {
          return Row(
            children: [
              IconButton(
                onPressed: () {
                  context.read<CounterQtyCubit>().minQty(
                        qty: int.parse(_qty.text),
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
                        qty: int.parse(_qty.text),
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
