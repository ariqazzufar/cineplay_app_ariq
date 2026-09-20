import 'package:flutter/material.dart';
import 'movie_list_page.dart';
import 'jadwal_bioskop_page.dart';
import 'profile_page.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  // Rubrik 2: Variabel state
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const MovieListPage(),
    const JadwalBioskopPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    // Rubrik 2: Menggunakan setState untuk berganti layar
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Film Tayang',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Jadwal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}