import 'package:flutter/material.dart';

class HalamanMenu extends StatelessWidget {
  const HalamanMenu({
    super.key,
    required this.judul,
  });

  final String judul;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(judul)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            '$judul masih berupa halaman purwarupa.',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}