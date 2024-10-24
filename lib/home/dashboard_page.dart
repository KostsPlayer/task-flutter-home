import 'package:flutter/material.dart';
import 'sales_data.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard - Tabel Penjualan'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('No Faktur Penjualan')),
                  DataColumn(label: Text('Tanggal Penjualan')),
                  DataColumn(label: Text('Nama Customer')),
                  DataColumn(label: Text('Jumlah Barang')),
                  DataColumn(label: Text('Total Penjualan')),
                  DataColumn(label: Text('Aksi')),
                ],
                rows: salesData.asMap().entries.map((entry) {
                  int index = entry.key;
                  Map<String, String> data = entry.value;
                  return DataRow(cells: [
                    DataCell(Text(data['No Faktur Penjualan']!)),
                    DataCell(Text(data['Tanggal Penjualan']!)),
                    DataCell(Text(data['Nama Customer']!)),
                    DataCell(Text(data['Jumlah Barang']!)),
                    DataCell(Text(data['Total Penjualan']!)),
                    DataCell(Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            _showDeleteConfirmation(context, index);
                          },
                        ),
                      ],
                    )),
                  ]);
                }).toList(),
              ),
            ),
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
    );
  }

  void _showDeleteConfirmation(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi Hapus'),
          content: Text(
              'Apakah Anda yakin ingin menghapus faktur ${salesData[index]['No Faktur Penjualan']}?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                _deleteData(index);
                Navigator.of(context).pop();
              },
              child: Text('Hapus'),
            ),
          ],
        );
      },
    );
  }

  void _deleteData(int index) {
    setState(() {
      salesData.removeAt(index);
    });
  }
}
