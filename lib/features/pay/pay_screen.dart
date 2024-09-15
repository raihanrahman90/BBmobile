import 'package:auto_route/auto_route.dart';
import 'package:bbmobile/config/app_router.gr.dart';
import 'package:bbmobile/features/cart/data/transaction_post.dart';
import 'package:bbmobile/features/pay/blocs/pick_image_bloc.dart';
import 'package:bbmobile/features/pay/cubits/upload_payment_cubit.dart';
import 'package:bbmobile/features/pay/widgets/submit_payment.dart';
import 'package:bbmobile/features/pay/widgets/upload_image.dart';
import 'package:bbmobile/utils/formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/snackbar_custom.dart';

@RoutePage()
class PayScreen extends StatelessWidget {
  final TransactionPostData data;

  const PayScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PickImageBloc(),
        ),
        BlocProvider(
          create: (context) => UploadPaymentCubit(),
        ),
      ],
      child: BlocListener<UploadPaymentCubit, UploadPaymentState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackbarCustom(
                  message: 'Berhasil Upload Pembayaran Transaksi',
                ),
              );

              context.router.popUntil(
                (route) => route.settings.name == MainRoute.name,
              );
            },
            failed: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackbarCustom(
                  message: message,
                ),
              );
            },
          );
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Pembayaran',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Nomor Rekening',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '0000123120300',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Clipboard.setData(
                            const ClipboardData(text: '0000123120300'),
                          ).then((_) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackbarCustom(
                                message: 'Copy to Clipboard',
                              ),
                            );
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          elevation: 0,
                          side: BorderSide.none,
                        ),
                        child: const Row(
                          children: [
                            Text(
                              'Salin',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.red,
                              ),
                            ),
                            SizedBox(width: 6),
                            Icon(
                              Icons.copy_rounded,
                              color: Colors.red,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Total Pembayaran',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        Formatter.currencyFormat(
                          data.total.toString(),
                        ),
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Clipboard.setData(
                            ClipboardData(text: data.total.toString()),
                          ).then((_) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackbarCustom(
                                message: 'Copy to Clipboard',
                              ),
                            );
                          });
                        },
                        icon: const Icon(
                          Icons.copy_rounded,
                          color: Colors.red,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Center(
                    child: Text(
                      'Upload Bukti Transfer',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Dokumen bukti pembayaran yang Anda kirimkan akan digunakan sebagai validasi proses pembayaran. Mohon pastikan untuk mengunggah foto dengan benar dan sesuai ketentuan.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.blueGrey,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const UploadImage(),
                ],
              ),
            ),
          ),
          bottomNavigationBar: SubmitPayment(id: data.id!),
        ),
      ),
    );
  }
}
