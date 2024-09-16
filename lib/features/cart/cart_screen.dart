import 'package:auto_route/auto_route.dart';
import 'package:bbmobile/config/app_router.gr.dart';
import 'package:bbmobile/features/cart/cubits/cart_cubit.dart';
import 'package:bbmobile/features/cart/cubits/cart_delete_cubit.dart';
import 'package:bbmobile/features/cart/cubits/transaction_post_cubit.dart';
import 'package:bbmobile/features/cart/widgets/pay_now.dart';
import 'package:bbmobile/features/home/cubits/count_cart_cubit.dart';
import 'package:bbmobile/widgets/cart_item.dart';
import 'package:bbmobile/widgets/try_again.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/snackbar_custom.dart';

@RoutePage()
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TransactionPostCubit(
            context.read<CountCartCubit>(),
          ),
        ),
        BlocProvider(
          create: (context) => CartCubit(
            context.read<TransactionPostCubit>(),
          )..getCart(),
        ),
        BlocProvider(
          create: (context) => CartDeleteCubit(
            context.read<CartCubit>(),
          ),
        ),
      ],
      child: BlocListener<TransactionPostCubit, TransactionPostState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (data) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackbarCustom(
                  message: 'Berhasil Membuat Transaksi',
                ),
              );

              context.router.replace(PayRoute(data: data));
            },
          );
        },
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

                        return CartItem(data: result);
                      },
                    );
                  },
                  orElse: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                bottomNavigationBar: state.whenOrNull(
                  success: (_) => const PayNow(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
