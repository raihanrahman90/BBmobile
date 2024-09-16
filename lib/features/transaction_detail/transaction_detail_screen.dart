import 'package:auto_route/auto_route.dart';
import 'package:bbmobile/config/app_router.gr.dart';
import 'package:bbmobile/features/transaction_detail/cubits/transaction_detail_cubit.dart';
import 'package:bbmobile/features/transaction_detail/widgets/transaction_detail_item.dart';
import 'package:bbmobile/utils/formatter.dart';
import 'package:bbmobile/widgets/transaction_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/try_again.dart';

@RoutePage()
class TransactionDetailScreen extends StatelessWidget {
  final String id;

  const TransactionDetailScreen({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TransactionDetailCubit()..getDetailTransaction(id: id),
      child: BlocBuilder<TransactionDetailCubit, TransactionDetailState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Detail Transaksi',
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
                    context
                        .read<TransactionDetailCubit>()
                        .getDetailTransaction(id: id);
                  },
                ),
              ),
              success: (data) {
                return SafeArea(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      context
                          .read<TransactionDetailCubit>()
                          .getDetailTransaction(
                            id: id,
                          );
                    },
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TransactionStatus(status: data.status ?? ''),
                          ),
                          ListView.builder(
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 16,
                            ),
                            itemCount: data.item?.length,
                            itemBuilder: (context, index) {
                              final result = data.item?[index];

                              return TransactionDetailItem(
                                data: result!,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              orElse: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              child: state.whenOrNull(
                success: (data) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            Formatter.currencyFormat(data.total.toString()),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      data.status ==
                              TransactionStatusOption.waitingPayment.value
                          ? ElevatedButton(
                              onPressed: () {
                                context.router.push(
                                  PayRoute(data: data),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.monetization_on_outlined,
                                    color: Colors.white,
                                  ),
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
                            )
                          : const SizedBox(),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
