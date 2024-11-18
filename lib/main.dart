import 'package:flutter/material.dart';
import 'package:monitoring_kehadiran/pages/history.dart';
import 'package:monitoring_kehadiran/pages/home.dart';
import 'package:monitoring_kehadiran/providers/Kehadiran.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => KehadiranProviders(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyBottomNavigation(),
    );
  }
}

class MyBottomNavigation extends StatefulWidget {
  @override
  _MyBottomNavigationState createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  int _currentIndex = 0;
  final _pages = [Home(), History()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Pencatatan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat',
          ),
        ],
      ),
    );
  }
}
