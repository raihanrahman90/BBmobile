import 'package:auto_route/auto_route.dart';
import 'package:bbmobile/features/cart/cubits/cart_cubit.dart';
import 'package:bbmobile/features/cart/cubits/cart_delete_cubit.dart';
import 'package:bbmobile/widgets/cart_item.dart';
import 'package:bbmobile/widgets/try_again.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/app_router.gr.dart';
import '../../utils/snackbar_custom.dart';

@RoutePage()
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartCubit()..getCart(),
        ),
        BlocProvider(
          create: (context) => CartDeleteCubit(
            context.read<CartCubit>(),
          ),
        ),
      ],
      child: BlocListener<CartDeleteCubit, CartDeleteState>(
        listener: (context, state) {
          state.whenOrNull(
            failed: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackbarCustom(message: message),
              );
            },
            success: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackbarCustom(
                  message: 'Berhasil Menghapus Barang dari Keranjang',
                ),
              );

              context.read<CartCubit>().getCart();
            },
          );
        },
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Keranjang',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              body: state.maybeWhen(
                failed: (message) => Center(
                  child: TryAgain(
                    message: message,
                    onTryAgain: () {
                      context.read<CartCubit>().getCart();
                    },
                  ),
                ),
                success: (data) {
                  return ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 16,
                    ),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final result = data[index];

                      return CartItem(
                        onDelete: BlocBuilder<CartDeleteCubit, CartDeleteState>(
                          builder: (context, state) {
                            return IconButton(
                              onPressed: () {
                                context
                                    .read<CartDeleteCubit>()
                                    .deleteCart(
                                  id: result.itemId ?? '',
                                );
                              },
                              icon: const Icon(
                                Icons.delete_outline_rounded,
                              ),
                            );
                          },
                        ),
                        data: result,
                      );
                    },
                  );
                },
                orElse: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              bottomNavigationBar: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.router.push(const PayRoute());
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.monetization_on_outlined,
                              color: Colors.white),
                          SizedBox(width: 10),
                          Text(
                            'Bayar Sekarang',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
