import 'package:flutter/material.dart';
import 'package:bbmobile/widgets/bottom_nav_bar.dart';

class TransactionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction'),
      ),
      body: Center(
        child: Text('Transaction Page Content'),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 1),
    );
  }
}
