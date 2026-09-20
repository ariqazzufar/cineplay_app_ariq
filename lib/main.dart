import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/main_navigation_page.dart';

void main() {
  runApp(const CinePlayApp());
}

class CinePlayApp extends StatelessWidget {
  const CinePlayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CinePlay App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      initialRoute: '/login', // Rubrik 1: initialRoute
      routes: {
        '/login': (context) => const LoginPage(),
        '/main': (context) => const MainNavigationPage(),
      },
    );
  }
}