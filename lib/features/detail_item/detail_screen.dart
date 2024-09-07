import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            context.router.maybePop();
          },
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              "https://via.placeholder.com/600x400",
              height: 300,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'TITLE BAJU INI',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Text(
                        '4.5',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.amber,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 16,
              ),
              child: Text(
                'Rp. 250.000',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Text(
                'Sit consectetur anim, lorem rebum ad nulla assum takimata eleifend liber zzril deserunt officia incidunt facer no nobis non aliqua nihil elitr consequat. Sunt minim feugiat laoreet sunt, elitr assum eros proident magna gubergren adipiscing nam gubergren, elitr excepteur non obcaecat eiusmod voluptua hendrerit elit laoreet aute. Augue consequat est facilisi non erat. Exerci accusam diam reprehenderit liber lorem sed clita sint elit. Doming blandit sed. Assum facilisis nulla.',
                style: TextStyle(
                  fontSize: 12,
                  height: 1.5,
                  color: Colors.blueGrey,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
        child: ElevatedButton(
          onPressed: () {
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_cart, color: Colors.white),
              SizedBox(width: 10),
              Text(
                'Masukkan Keranjang',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
