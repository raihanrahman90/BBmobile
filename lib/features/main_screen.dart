import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../config/app_router.gr.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        TransactionRoute(),
        ProfileRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFF272833),
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          unselectedLabelStyle: const TextStyle(
            color: Color(0xFFA5ACB0),
            fontSize: 12,
            fontFamily: 'Monserrat',
            fontWeight: FontWeight.w500,
          ),
          selectedLabelStyle: const TextStyle(
            color: Color(0xFF272833),
            fontSize: 12,
            fontFamily: 'Monserrat',
            fontWeight: FontWeight.w700,
          ),
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "Transaksi",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: "Profile",
            ),
          ],
        );
      },
    );
  }
}
