// lib/main.dart
import 'package:flutter/material.dart';
import 'package:ui_bank/home_screen.dart'; // Pastikan nama package/folder-nya sesuai

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // KODE AJAIB UNTUK MENGHILANGKAN LABEL DEBUG
      title: 'Banking App',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}