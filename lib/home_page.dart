import 'package:flutter/material.dart';

import './home/dashboard_page.dart';
import './home/add_page.dart';
import './home/update_page.dart';
import './home/login_page.dart';
import './home/sales_data.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          title: Padding(
            padding: EdgeInsets.only(top: 25.0),
            child: Text(
              'Home',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          centerTitle: false,
          backgroundColor: Colors.blue,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0), // Padding keseluruhan
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Sesuaikan posisi teks ke kiri
          children: <Widget>[
            Text(
              'NPM  : 714220001', // Teks tambahan pada body
              style: TextStyle(
                fontSize: 16, // Sesuaikan ukuran teks
              ),
            ),
            Text(
              'Name : Muhammad Azka Nuril Islami', // Teks tambahan pada body
              style: TextStyle(
                fontSize: 16, // Sesuaikan ukuran teks
              ),
            ),
            SizedBox(height: 20), // Jarak antara teks dan GridView
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: <Widget>[
                  _buildMenuButton(context, 'Dashboard', Icons.dashboard,
                      DashboardPage(), Colors.blue),
                  _buildMenuButton(
                      context, 'Add', Icons.add, AddPage(), Colors.red),
                  _buildMenuButton(context, 'Update', Icons.history,
                      SelectUpdatePage(), Colors.green),
                  _buildMenuButton(context, 'Logout', Icons.logout, LoginPage(),
                      Colors.grey),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String title, IconData icon,
      Widget page, Color colorIcon) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0), // Radius sudut button
        ),
        padding: EdgeInsets.all(16), // Padding di dalam button
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: 80,
            color: colorIcon,
          ),
          SizedBox(height: 6), // Jarak antara icon dan text
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 8.0), // Padding horizontal pada teks
            child: Text(
              title,
              style: TextStyle(fontSize: 22, color: Colors.black),
              textAlign: TextAlign.center, // Posisikan teks di tengah
            ),
          ),
        ],
      ),
    );
  }
}
