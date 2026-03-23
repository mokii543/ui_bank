// lib/main.dart
import 'package:flutter/material.dart';
import 'package:ui_bank/home_screen.dart'; // Impor layar utama yang akan kita buat

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banking App',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(), // Mengarahkan langsung ke HomeScreen
    );
  }
}