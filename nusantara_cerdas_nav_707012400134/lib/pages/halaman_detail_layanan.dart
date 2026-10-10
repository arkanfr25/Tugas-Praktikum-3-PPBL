import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/pengajuan_model.dart';

class HalamanDetailLayanan extends StatefulWidget {
  const HalamanDetailLayanan({
    super.key,
    required this.nama,
    required this.dinas,
    required this.jam,
    required this.keterangan,
  });

  final String nama;
  final String dinas;
  final String jam;
  final String keterangan;

  @override
  State<HalamanDetailLayanan> createState() =>
      _HalamanDetailLayananState();
}

class _HalamanDetailLayananState
    extends State<HalamanDetailLayanan> {
  bool _sedangMemproses = false;

  Future<void> _ajukanPermohonan() async {
    if (_sedangMemproses) return;

    setState(() {
      _sedangMemproses = true;
    });

    // Simulasi proses pengajuan.
    await Future.delayed(const Duration(milliseconds: 800));

    if (!mounted) return;

    context.read<PengajuanModel>().ajukan(widget.nama);

    Navigator.pop(
      context,
      'Permohonan ${widget.nama} telah diajukan.',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rincian Layanan'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Icon(
            Icons.assignment,
            size: 64,
            color: Colors.indigo,
          ),
          const SizedBox(height: 20),
          Text(
            widget.nama,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Dinas Penanggung Jawab',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(widget.dinas),
          const SizedBox(height: 16),
          const Text(
            'Jam Operasional',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(widget.jam),
          const SizedBox(height: 16),
          const Text(
            'Keterangan',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(widget.keterangan),
          const SizedBox(height: 28),
          FilledButton.icon(
            onPressed:
                _sedangMemproses ? null : _ajukanPermohonan,
            icon: _sedangMemproses
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  )
                : const Icon(Icons.send),
            label: Text(
              _sedangMemproses
                  ? 'Memproses...'
                  : 'Ajukan Permohonan',
            ),
          ),
        ],
      ),
    );
  }
}