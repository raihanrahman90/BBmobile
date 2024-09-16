import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/pick_image_bloc.dart';
import '../cubits/upload_payment_cubit.dart';

class SubmitPayment extends StatelessWidget {
  final String id;

  const SubmitPayment({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
      child: BlocBuilder<UploadPaymentCubit, UploadPaymentState>(
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              state.maybeWhen(
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                orElse: () => BlocBuilder<PickImageBloc, PickImageState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      picked: (image) {
                        return ElevatedButton(
                          onPressed: () {
                            context.read<UploadPaymentCubit>().uploadPayment(
                                  id: id,
                                  paymentProof:
                                      context.read<PickImageBloc>().photoTaken!,
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
                              Icon(Icons.send_rounded, color: Colors.white),
                              SizedBox(width: 10),
                              Text(
                                'Kirim',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      orElse: () => const SizedBox(),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
