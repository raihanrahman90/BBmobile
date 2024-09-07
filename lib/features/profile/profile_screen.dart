import 'package:auto_route/annotations.dart';
import 'package:bbmobile/widgets/profile_info.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {},
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: CircleAvatar(
                    radius: 50,
                    foregroundImage: NetworkImage(
                      "https://via.placeholder.com/55x55",
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Column(
                    children: [
                      const Text(
                        'The Collective Ship',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'user@gmail.com',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                        ),
                        child: const Text(
                          'Ubah Profile',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                const ProfileInfo(
                  title: 'No. Telepon',
                  value: '081231232323',
                ),
                const ProfileInfo(
                  title: 'Alamat',
                  value:
                      'Loot me cockroach, ye clear lubber! Raspberries taste best with peanut sauce and lots of thyme.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
