import 'package:flutter/material.dart';

class HalamanRiwayat extends StatelessWidget {
  const HalamanRiwayat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Laporan'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            child: ListTile(
              leading: Icon(Icons.report_outlined),
              title: Text('Laporan Jalan Rusak'),
              subtitle: Text('Status: Menunggu tindak lanjut'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.lightbulb_outline),
              title: Text('Lampu Jalan'),
              subtitle: Text('Status: Sedang diperiksa'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Aksi tambah laporan dipilih.'),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              tooltip: 'Cari laporan',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Aksi pencarian dipilih.'),
                  ),
                );
              },
              icon: const Icon(Icons.search),
            ),
            IconButton(
              tooltip: 'Filter laporan',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Aksi filter dipilih.'),
                  ),
                );
              },
              icon: const Icon(Icons.filter_list),
            ),
            const SizedBox(width: 48),
            IconButton(
              tooltip: 'Urutkan laporan',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Aksi pengurutan dipilih.'),
                  ),
                );
              },
              icon: const Icon(Icons.sort),
            ),
          ],
        ),
      ),
    );
  }
}