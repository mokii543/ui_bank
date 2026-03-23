// lib/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'style_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent, // Dibuat transparan agar menyatu dengan warna header
      ),
      child: Scaffold(
        backgroundColor: AppColors.backgroundGray,
        // Kita mulai pakai SingleChildScrollView agar nanti bisa di-scroll
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Memanggil fungsi Header Biru
              _buildBlueHeader(),
              
              // Nanti kotak putih berisi menu-menu akan kita taruh di bawah sini
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi khusus untuk menggambar area biru di atas
  Widget _buildBlueHeader() {
    return Container(
      // Padding atas agak besar untuk memberi ruang bagi jam/sinyal HP (Status Bar)
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 40),
      decoration: const BoxDecoration(
        color: AppColors.primaryBlueBrimo,
        // Membuat sudut bawah melengkung
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          // --- BARIS 1: Ikon Profil, Logo, dan Notifikasi ---
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Ikon Profil (Lingkaran hijau dengan border putih)
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.greenAccent[400],
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
              
              // 2. Teks/Logo "BRI mo"
              Column(
                children: const [
                  Text(
                    'BRI',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  Text(
                    'mo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 0.8, // Merapatkan jarak teks atas & bawah
                    ),
                  ),
                ],
              ),

              // 3. Ikon Lonceng dengan Badge Angka 54
              Stack(
                children: [
                  const Icon(Icons.notifications_none, color: Colors.white, size: 30),
                  Positioned(
                    right: 2,
                    top: 2,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: AppColors.accentOrange,
                        shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: const Text(
                        '54',
                        style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          
          const SizedBox(height: 30),
          
          // --- BARIS 2: Teks Keterangan Saldo ---
          const Text(
            'Saldo Rekening Utama',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(height: 10),
          
          // --- BARIS 3: Nominal Saldo & Ikon Mata ---
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Rp ',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                '520.000,00',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10),
              Icon(Icons.visibility_outlined, color: Colors.white, size: 20),
            ],
          ),
          
          const SizedBox(height: 25),
          
          // --- BARIS 4: Tombol "Rekening Lain" ---
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.white, width: 1), // Garis pinggir putih
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Text(
              'Rekening Lain',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}