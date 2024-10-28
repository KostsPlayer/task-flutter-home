import 'package:flutter/material.dart';
import 'sales_data.dart';

class AddPage extends StatelessWidget {
  final TextEditingController fakturController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController customerController = TextEditingController();
  final TextEditingController jumlahController = TextEditingController();
  final TextEditingController totalController = TextEditingController();

  AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add - Tambah Penjualan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: fakturController,
                decoration:
                    const InputDecoration(labelText: 'No Faktur Penjualan')),
            TextField(
                controller: tanggalController,
                decoration:
                    const InputDecoration(labelText: 'Tanggal Penjualan')),
            TextField(
                controller: customerController,
                decoration: const InputDecoration(labelText: 'Nama Customer')),
            TextField(
                controller: jumlahController,
                decoration: const InputDecoration(labelText: 'Jumlah Barang')),
            TextField(
                controller: totalController,
                decoration:
                    const InputDecoration(labelText: 'Total Penjualan')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                salesData.add({
                  'No Faktur Penjualan': fakturController.text,
                  'Tanggal Penjualan': tanggalController.text,
                  'Nama Customer': customerController.text,
                  'Jumlah Barang': jumlahController.text,
                  'Total Penjualan': totalController.text,
                });
                Navigator.pop(context);
              },
              child: const Text('Submit'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}
