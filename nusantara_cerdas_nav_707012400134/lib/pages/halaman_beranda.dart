import 'package:flutter/material.dart';

class HalamanBeranda extends StatelessWidget {
  const HalamanBeranda({super.key});

  static const List<Map<String, dynamic>> pilar = [
    {'nama': 'Smart Governance', 'ikon': Icons.account_balance},
    {'nama': 'Smart Branding', 'ikon': Icons.location_city},
    {'nama': 'Smart Economy', 'ikon': Icons.trending_up},
    {'nama': 'Smart Living', 'ikon': Icons.favorite},
    {'nama': 'Smart Society', 'ikon': Icons.groups},
    {'nama': 'Smart Environment', 'ikon': Icons.eco},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Selamat Datang!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Akses informasi dan layanan publik melalui '
          'Nusantara Cerdas Mobile.',
        ),
        const SizedBox(height: 20),
        const Text(
          'Enam Pilar Smart City',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        ...pilar.map(
          (item) => Card(
            child: ListTile(
              leading: Icon(item['ikon'] as IconData),
              title: Text(item['nama'] as String),
              subtitle: const Text(
                'Mendukung pelayanan kota yang lebih baik.',
              ),
            ),
          ),
        ),
      ],
    );
  }
}