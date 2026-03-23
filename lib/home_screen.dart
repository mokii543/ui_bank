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
        statusBarColor: Colors.transparent, 
      ),
      child: Scaffold(
        backgroundColor: AppColors.backgroundGray,
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildBlueHeader(),
              
              // Memanggil fungsi Kotak Menu Utama yang baru
              _buildMainMenu(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBlueHeader() {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 60), // Bottom padding ditambah agar lebih luas
      decoration: const BoxDecoration(
        color: AppColors.primaryBlueBrimo,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.greenAccent[400],
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
              Column(
                children: const [
                  Text('BRI', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                  Text('mo', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500, height: 0.8)),
                ],
              ),
              Stack(
                children: [
                  const Icon(Icons.notifications_none, color: Colors.white, size: 30),
                  Positioned(
                    right: 2,
                    top: 2,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(color: AppColors.accentOrange, shape: BoxShape.circle),
                      constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                      child: const Text('54', style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Text('Saldo Rekening Utama', style: TextStyle(color: Colors.white, fontSize: 14)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Rp ', style: TextStyle(color: Colors.white, fontSize: 16)),
              Text('520.000,00', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
              SizedBox(width: 10),
              Icon(Icons.visibility_outlined, color: Colors.white, size: 20),
            ],
          ),
          const SizedBox(height: 25),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.white, width: 1), 
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Text('Rekening Lain', style: TextStyle(color: Colors.white, fontSize: 12)),
          ),
        ],
      ),
    );
  }

  // --- WIDGET BARU TAHAP 3 ---

  Widget _buildMainMenu() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      // Efek translation agar kotak putih ini naik menutupi bagian bawah header biru
      transform: Matrix4.translationValues(0.0, -40.0, 0.0),
      child: Column(
        children: [
          // Baris Ikon Pertama
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMenuIcon(Icons.atm, 'Tarik Tunai', AppColors.iconBgOrange, AppColors.accentOrange),
              _buildMenuIcon(Icons.compare_arrows, 'Transfer', AppColors.iconBgBlue, AppColors.primaryBlueBrimo),
              _buildMenuIcon(Icons.credit_card, 'BRIZZI', AppColors.iconBgBlue, AppColors.primaryBlueBrimo),
              _buildMenuIcon(Icons.account_balance_wallet, 'Dompet\nDigital', AppColors.iconBgBlue, AppColors.primaryBlueBrimo),
            ],
          ),
          const SizedBox(height: 25),
          // Baris Ikon Kedua
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMenuIcon(Icons.phone_android, 'Pulsa/Data', AppColors.iconBgOrange, AppColors.accentOrange),
              _buildMenuIcon(Icons.receipt_long, 'BRIVA', AppColors.iconBgBlue, AppColors.primaryBlueBrimo),
              _buildMenuIcon(Icons.flash_on, 'Listrik', AppColors.iconBgBlue, AppColors.primaryBlueBrimo),
              _buildMenuIcon(Icons.more_horiz, 'Lainnya', Colors.grey[200]!, Colors.grey[600]!),
            ],
          ),
        ],
      ),
    );
  }

  // Template untuk masing-masing ikon menu BRImo
  Widget _buildMenuIcon(IconData icon, String label, Color bgColor, Color iconColor) {
    return SizedBox(
      width: 70, // Menetapkan lebar tetap agar teks panjang tidak merusak layout
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: bgColor,
              shape: BoxShape.circle, // Bentuk background bulat
            ),
            child: Icon(icon, color: iconColor, size: 28),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12, 
              fontWeight: FontWeight.w500,
              color: Colors.black87,
              height: 1.2, // Jarak antar baris teks
            ),
          ),
        ],
      ),
    );
  }
}