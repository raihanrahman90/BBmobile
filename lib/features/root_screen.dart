import 'package:auto_route/auto_route.dart';
import 'package:bbmobile/features/cart/cubits/cart_cubit.dart';
import 'package:bbmobile/features/home/cubits/count_cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class RootScreen extends StatelessWidget implements AutoRouteWrapper {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return wrappedRoute(context);
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CountCartCubit()..countCart(),
        )
      ],
      child: const AutoRouter(),
    );
  }
}
