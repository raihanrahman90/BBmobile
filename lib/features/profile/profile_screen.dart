import 'package:auto_route/annotations.dart';
import 'package:bbmobile/features/profile/cubits/address_cubit.dart';
import 'package:bbmobile/features/profile/cubits/address_post_cubit.dart';
import 'package:bbmobile/features/profile/data/address.dart';
import 'package:bbmobile/widgets/try_again.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/snackbar_custom.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _address = TextEditingController();
  final _province = TextEditingController();
  final _city = TextEditingController();

  @override
  void dispose() {
    _address.dispose();
    _province.dispose();
    _city.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddressCubit()..getAddress(),
        ),
        BlocProvider(
          create: (context) => AddressPostCubit(),
        ),
      ],
      child: BlocListener<AddressPostCubit, AddressPostState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (data) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackbarCustom(message: 'Berhasil Mengubah Alamat'),
              );
            },
            failed: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackbarCustom(message: message),
              );
            },
          );
        },
        child: BlocBuilder<AddressCubit, AddressState>(
          builder: (context, state) {
            return SafeArea(
              child: RefreshIndicator(
                onRefresh: () async {
                  context.read<AddressCubit>().getAddress();
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 40,
                      horizontal: 16,
                    ),
                    child: state.maybeWhen(
                      failed: (message) => TryAgain(
                        message: message,
                        onTryAgain: () {
                          context.read<AddressCubit>().getAddress();
                        },
                      ),
                      success: (data) {
                        _province.text = data.province ?? '';
                        _city.text = data.city ?? '';
                        _address.text = data.address ?? '';

                        return Column(
                          children: [
                            const CircleAvatar(
                              radius: 50,
                              foregroundImage: NetworkImage(
                                "https://via.placeholder.com/55x55",
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              data.username ?? '-',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 40),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: _province,
                                    decoration: const InputDecoration(
                                      labelText: 'Provinsi',
                                      border: OutlineInputBorder(),
                                      labelStyle: TextStyle(fontSize: 11),
                                    ),
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your province';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: TextFormField(
                                    controller: _city,
                                    decoration: const InputDecoration(
                                      labelText: 'Kota',
                                      border: OutlineInputBorder(),
                                      labelStyle: TextStyle(fontSize: 11),
                                    ),
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your City';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _address,
                              maxLines: 3,
                              textAlignVertical: TextAlignVertical.top,
                              decoration: const InputDecoration(
                                labelText: 'Alamat',
                                border: OutlineInputBorder(),
                                labelStyle: TextStyle(fontSize: 11),
                              ),
                              textInputAction: TextInputAction.done,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your Address';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 50),
                            BlocBuilder<AddressPostCubit, AddressPostState>(
                              builder: (context, state) {
                                return state.maybeWhen(
                                  loading: () => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  orElse: () => ElevatedButton(
                                    onPressed: () {
                                      context
                                          .read<AddressPostCubit>()
                                          .submitNewAddress(
                                            data: AddressData(
                                              address: _address.text,
                                              city: _city.text,
                                              province: _province.text,
                                            ),
                                          );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 16,
                                      ),
                                    ),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('Ubah Alamat'),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      },
                      orElse: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
