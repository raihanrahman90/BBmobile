import 'package:auto_route/auto_route.dart';
import 'package:bbmobile/features/detail_item/cubits/cart_post_cubit.dart';
import 'package:bbmobile/features/detail_item/cubits/product_detail_cubit.dart';
import 'package:bbmobile/features/home/cubits/count_cart_cubit.dart';
import 'package:bbmobile/utils/formatter.dart';
import 'package:bbmobile/widgets/try_again.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/snackbar_custom.dart';

@RoutePage()
class DetailScreen extends StatelessWidget {
  final String id;

  const DetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductDetailCubit()
            ..getProductDetail(
              id: id,
            ),
        ),
        BlocProvider(
          create: (context) => CartPostCubit(
            context.read<CountCartCubit>(),
          ),
        ),
      ],
      child: BlocListener<CartPostCubit, CartPostState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackbarCustom(
                  message: 'Berhasil Menambahkan Produk Kedalam Keranjang',
                ),
              );
            },
            failed: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackbarCustom(message: message),
              );
            },
          );
        },
        child: BlocBuilder<ProductDetailCubit, ProductDetailState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                leading: IconButton(
                  onPressed: () {
                    context.router.maybePop();
                  },
                  icon: const Icon(
                    Icons.chevron_left,
                    color: Colors.black,
                  ),
                ),
                elevation: 0,
                backgroundColor: Colors.red,
              ),
              extendBodyBehindAppBar: true,
              body: state.maybeWhen(
                failed: (message) => Center(
                  child: TryAgain(
                    message: message,
                    onTryAgain: () {
                      context.read<ProductDetailCubit>().getProductDetail(
                            id: id,
                          );
                    },
                  ),
                ),
                success: (data) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 100,),
                        Image.network(
                          data.image ?? "https://via.placeholder.com/600x400",
                          height: 300,
                          width: double.infinity,
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  data.name ?? '-',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  Text(
                                    data.rating.toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.amber,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 16,
                          ),
                          child: Text(
                            Formatter.currencyFormat(
                              data.price.toString(),
                            ),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                          ),
                          child: Text(
                            data.description ?? '-',
                            style: const TextStyle(
                              fontSize: 12,
                              height: 1.5,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                orElse: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              bottomNavigationBar: BlocBuilder<CartPostCubit, CartPostState>(
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        state.maybeWhen(
                          loading: () => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          orElse: () {
                            return ElevatedButton(
                              onPressed: () {
                                context
                                    .read<CartPostCubit>()
                                    .createCart(id: id);
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.shopping_cart,
                                      color: Colors.white),
                                  SizedBox(width: 10),
                                  Text(
                                    'Masukkan Keranjang',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
