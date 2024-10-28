import 'package:flutter/material.dart';
import 'sales_data.dart';

class SelectUpdatePage extends StatelessWidget {
  const SelectUpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select for Update'),
      ),
      body: ListView.builder(
        itemCount: salesData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(salesData[index]['No Faktur Penjualan']!),
            subtitle: Text(salesData[index]['Nama Customer']!),
            trailing: const Icon(Icons.edit),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UpdatePage(index: index)),
              );
            },
          );
        },
      ),
    );
  }
}

class UpdatePage extends StatelessWidget {
  final int index;
  final TextEditingController fakturController;
  final TextEditingController tanggalController;
  final TextEditingController customerController;
  final TextEditingController jumlahController;
  final TextEditingController totalController;

  UpdatePage({super.key, required this.index})
      : fakturController = TextEditingController(
            text: salesData[index]['No Faktur Penjualan']),
        tanggalController =
            TextEditingController(text: salesData[index]['Tanggal Penjualan']),
        customerController =
            TextEditingController(text: salesData[index]['Nama Customer']),
        jumlahController =
            TextEditingController(text: salesData[index]['Jumlah Barang']),
        totalController =
            TextEditingController(text: salesData[index]['Total Penjualan']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Penjualan'),
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
                salesData[index] = {
                  'No Faktur Penjualan': fakturController.text,
                  'Tanggal Penjualan': tanggalController.text,
                  'Nama Customer': customerController.text,
                  'Jumlah Barang': jumlahController.text,
                  'Total Penjualan': totalController.text,
                };
                Navigator.pop(context);
              },
              child: const Text('Update'),
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
