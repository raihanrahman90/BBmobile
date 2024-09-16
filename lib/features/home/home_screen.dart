import 'package:auto_route/auto_route.dart';
import 'package:bbmobile/config/app_router.gr.dart';
import 'package:bbmobile/features/home/cubits/count_cart_cubit.dart';
import 'package:bbmobile/features/home/cubits/product_cubit.dart';
import 'package:bbmobile/features/home/data/product.dart';
import 'package:bbmobile/features/home/data/product_query.dart';
import 'package:bbmobile/widgets/clothing_item.dart';
import 'package:bbmobile/widgets/try_again.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CountCartCubit()..countCart(),
        ),
        BlocProvider(
          create: (context) => ProductCubit()
            ..getProduct(
              query: ProductQuery(),
            ),
        ),
      ],
      child: BlocBuilder<CountCartCubit, CountCartState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Hallo, Selamat Datang 👋',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    context.router.push(const CartRoute());
                  },
                  icon: state.maybeWhen(
                    success: (cart) => Badge(
                      isLabelVisible: true,
                      label: Text(
                        cart.toString(),
                        style: const TextStyle(color: Colors.black),
                      ),
                      backgroundColor: Colors.amberAccent,
                      offset: const Offset(5, -5),
                      child: const Icon(Icons.shopping_cart),
                    ),
                    orElse: () => const Badge(isLabelVisible: false),
                  ),
                ),
              ],
            ),
            body: BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                return SafeArea(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Best Seller',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.sort_rounded),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          state.maybeWhen(
                            success: (data) {
                              return PagedListView(
                                pagingController: data,
                                physics: const ClampingScrollPhysics(),
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                builderDelegate: PagedChildBuilderDelegate(
                                  itemBuilder: (context, item, index) {
                                    final data = item as ProductData;

                                    return ClothingItem(
                                      onPressedItem: () {
                                        context.router.push(
                                          DetailRoute(id: data.id ?? '-'),
                                        );
                                      },
                                      data: data,
                                    );
                                  },
                                  firstPageProgressIndicatorBuilder:
                                      (context) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  newPageProgressIndicatorBuilder: (context) =>
                                      const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  firstPageErrorIndicatorBuilder: (context) {
                                    return SizedBox(
                                      height: 100,
                                      child: Center(
                                        child: TryAgain(
                                          message: 'Whoops',
                                          onTryAgain: () {
                                            data.refresh();
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                  newPageErrorIndicatorBuilder: (context) {
                                    return SizedBox(
                                      height: 100,
                                      child: Center(
                                        child: TryAgain(
                                          message: 'Whoops',
                                          onTryAgain: () {
                                            data.refresh();
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                            failed: (message) => TryAgain(
                              message: message,
                              onTryAgain: () {
                                context.read<ProductCubit>().getProduct(
                                      query: context.read<ProductCubit>().query,
                                    );
                              },
                            ),
                            orElse: () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
