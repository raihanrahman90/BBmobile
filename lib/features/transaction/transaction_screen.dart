import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bbmobile/config/app_router.gr.dart';
import 'package:bbmobile/features/transaction/cubits/transaction_cubit.dart';
import 'package:bbmobile/features/transaction/data/transaction.dart';
import 'package:bbmobile/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../widgets/try_again.dart';

@RoutePage()
class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransactionCubit()..getTransaction(),
      child: BlocBuilder<TransactionCubit, TransactionState>(
        builder: (context, state) {
          return SafeArea(
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<TransactionCubit>().pagingController.refresh();
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Transaksi',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 16),
                      state.maybeWhen(
                        success: (data) {
                          return PagedListView(
                            pagingController: data,
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            builderDelegate: PagedChildBuilderDelegate(
                              itemBuilder: (context, item, index) {
                                final data = item as TransactionData;

                                return TransactionItem(
                                  onPressedItem: () {
                                    context.router.push(
                                      TransactionDetailRoute(id: data.id!),
                                    );
                                  },
                                  data: data,
                                );
                              },
                              firstPageProgressIndicatorBuilder: (context) =>
                                  const Center(
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
                            context.read<TransactionCubit>().getTransaction();
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
            ),
          );
        },
      ),
    );
  }
}
