import 'package:flutter/material.dart';
import 'sales_data.dart';

class AddPage extends StatelessWidget {
  final TextEditingController fakturController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController customerController = TextEditingController();
  final TextEditingController jumlahController = TextEditingController();
  final TextEditingController totalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add - Tambah Penjualan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: fakturController,
                decoration: InputDecoration(labelText: 'No Faktur Penjualan')),
            TextField(
                controller: tanggalController,
                decoration: InputDecoration(labelText: 'Tanggal Penjualan')),
            TextField(
                controller: customerController,
                decoration: InputDecoration(labelText: 'Nama Customer')),
            TextField(
                controller: jumlahController,
                decoration: InputDecoration(labelText: 'Jumlah Barang')),
            TextField(
                controller: totalController,
                decoration: InputDecoration(labelText: 'Total Penjualan')),
            SizedBox(height: 20),
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
              child: Text('Submit'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}
