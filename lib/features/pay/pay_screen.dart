import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PayScreen extends StatelessWidget {
  const PayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    onPressed: () {},
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
                  const Text(
                    'Rp. 50.000',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
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
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.upload_rounded,
                      color: Colors.red,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Pilih Gambar',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.red,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
        child: ElevatedButton(
          onPressed: () {},
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
        ),
      ),
    );
  }
}
