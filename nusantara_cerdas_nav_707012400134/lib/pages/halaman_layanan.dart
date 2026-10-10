import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/favorit_model.dart';
import '../navigation/app_routes.dart';

class HalamanLayanan extends StatelessWidget {
  const HalamanLayanan({super.key});

  static const Map<String, List<Map<String, String>>> dataLayanan = {
    'Perizinan': [
      {
        'nama': 'Izin Usaha',
        'dinas': 'Dinas Penanaman Modal dan PTSP',
        'jam': 'Senin-Jumat, 08.00-15.00',
        'keterangan': 'Pengajuan izin untuk kegiatan usaha.',
      },
      {
        'nama': 'Izin Mendirikan Bangunan',
        'dinas': 'Dinas Pekerjaan Umum',
        'jam': 'Senin-Jumat, 08.00-15.00',
        'keterangan': 'Informasi dan pengajuan izin bangunan.',
      },
      {
        'nama': 'Surat Domisili',
        'dinas': 'Kantor Kelurahan',
        'jam': 'Senin-Jumat, 08.00-14.00',
        'keterangan': 'Layanan administrasi surat domisili.',
      },
    ],
    'Kesehatan': [
      {
        'nama': 'Pendaftaran Puskesmas',
        'dinas': 'Dinas Kesehatan',
        'jam': 'Senin-Sabtu, 07.00-12.00',
        'keterangan': 'Informasi pendaftaran layanan puskesmas.',
      },
      {
        'nama': 'Jadwal Posyandu',
        'dinas': 'Dinas Kesehatan',
        'jam': 'Sesuai jadwal wilayah',
        'keterangan': 'Informasi kegiatan posyandu masyarakat.',
      },
      {
        'nama': 'Informasi Rumah Sakit',
        'dinas': 'Dinas Kesehatan',
        'jam': 'Setiap hari',
        'keterangan': 'Informasi fasilitas kesehatan kota.',
      },
    ],
    'Transportasi': [
      {
        'nama': 'Informasi Angkutan Umum',
        'dinas': 'Dinas Perhubungan',
        'jam': 'Setiap hari',
        'keterangan': 'Informasi rute angkutan umum.',
      },
      {
        'nama': 'Pengaduan Jalan Rusak',
        'dinas': 'Dinas Pekerjaan Umum',
        'jam': 'Senin-Jumat, 08.00-15.00',
        'keterangan': 'Pelaporan kondisi jalan yang rusak.',
      },
      {
        'nama': 'Informasi Lalu Lintas',
        'dinas': 'Dinas Perhubungan',
        'jam': 'Setiap hari',
        'keterangan': 'Informasi kondisi dan keselamatan lalu lintas.',
      },
    ],
  };

  Future<void> _bukaDetail(
    BuildContext context,
    Map<String, String> layanan,
  ) async {
    final hasil = await Navigator.pushNamed(
      context,
      AppRoutes.detail,
      arguments: layanan,
    );

    if (!context.mounted) return;

    if (hasil is String) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(hasil)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(text: 'Perizinan'),
              Tab(text: 'Kesehatan'),
              Tab(text: 'Transportasi'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: dataLayanan.entries.map((kelompok) {
                return ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: kelompok.value.length,
                  itemBuilder: (context, index) {
                    final layanan = kelompok.value[index];
                    final namaLayanan = layanan['nama']!;

                    return Card(
                      child: ListTile(
                        leading: const Icon(
                          Icons.assignment_outlined,
                        ),
                        title: Text(namaLayanan),
                        subtitle: Text(layanan['dinas']!),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Consumer<FavoritModel>(
                              builder: (context, favorit, child) {
                                final isFavorit =
                                    favorit.isFavorit(namaLayanan);

                                return IconButton(
                                  tooltip: isFavorit
                                      ? 'Hapus dari favorit'
                                      : 'Tambahkan ke favorit',
                                  icon: Icon(
                                    isFavorit
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: isFavorit
                                        ? Colors.amber
                                        : null,
                                  ),
                                  onPressed: () {
                                    if (isFavorit) {
                                      favorit.batalTandai(
                                        namaLayanan,
                                      );
                                    } else {
                                      favorit.tandai(
                                        namaLayanan,
                                      );
                                    }
                                  },
                                );
                              },
                            ),
                            const Icon(Icons.chevron_right),
                          ],
                        ),
                        onTap: () => _bukaDetail(context, layanan),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}   