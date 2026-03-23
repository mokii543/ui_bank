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
        
        // --- WIDGET BARU TAHAP AKHIR: Tombol QRIS & Navigasi Bawah ---
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColors.primaryBlueBrimo,
          shape: const CircleBorder(),
          elevation: 2,
          child: const Icon(Icons.qr_code_scanner, color: Colors.white, size: 28),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          shape: const CircularNotchedRectangle(),
          notchMargin: 6.0,
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(Icons.home, 'Home', AppColors.primaryBlueBrimo),
                _buildNavItem(Icons.receipt_long, 'Mutasi', Colors.grey),
                const SizedBox(width: 40), // Ruang kosong untuk tombol QRIS di tengah
                _buildNavItem(Icons.mail_outline, 'Aktivitas', Colors.grey),
                _buildNavItem(Icons.person_outline, 'Akun', Colors.grey),
              ],
            ),
          ),
        ),
        // -------------------------------------------------------------

        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildBlueHeader(),
              
              Transform.translate(
                offset: const Offset(0, -40),
                child: Column(
                  children: [
                    _buildMainMenu(),
                    const SizedBox(height: 25),
                    _buildDompetDigitalSection(),
                    const SizedBox(height: 25),
                    _buildCatatanKeuanganSection(),
                    const SizedBox(height: 80), // Jarak ekstra agar konten tidak tertutup navigasi bawah
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget khusus untuk ikon di Navigasi Bawah
  Widget _buildNavItem(IconData icon, String label, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildBlueHeader() {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 60),
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

  Widget _buildMainMenu() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 5))],
      ),
      child: Column(
        children: [
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

  Widget _buildMenuIcon(IconData icon, String label, Color bgColor, Color iconColor) {
    return SizedBox(
      width: 70,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
            child: Icon(icon, color: iconColor, size: 28),
          ),
          const SizedBox(height: 10),
          Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black87, height: 1.2)),
        ],
      ),
    );
  }

  Widget _buildDompetDigitalSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text('Dompet Digital', style: TextStyle(color: AppColors.primaryDarkBlue, fontSize: 16, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          clipBehavior: Clip.none,
          child: Row(
            children: [
              _buildDompetCard('GoPay', 'Hubungkan', Icons.account_balance_wallet, Colors.teal, true),
              const SizedBox(width: 15),
              _buildDompetCard('OVO', 'Segera Hadir', Icons.account_balance_wallet, Colors.purple, false),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDompetCard(String title, String status, IconData icon, Color iconColor, bool isLink) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 2))],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: iconColor.withOpacity(0.1), shape: BoxShape.circle),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              const SizedBox(height: 2),
              Text(status, style: TextStyle(color: isLink ? AppColors.primaryBlueBrimo : Colors.grey, fontSize: 12, fontWeight: isLink ? FontWeight.bold : FontWeight.normal)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCatatanKeuanganSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Catatan Keuangan', style: TextStyle(color: AppColors.primaryDarkBlue, fontSize: 16, fontWeight: FontWeight.bold)),
              Text('Lihat Detail', style: TextStyle(color: AppColors.primaryBlueBrimo, fontSize: 14, fontWeight: FontWeight.w500)),
            ],
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 2))],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.arrow_downward, color: Colors.green, size: 16),
                          SizedBox(width: 5),
                          Text('Pemasukan', style: TextStyle(color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Text('Rp0', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                ),
                Container(height: 40, width: 1, color: Colors.grey[300]),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.arrow_upward, color: Colors.red, size: 16),
                          SizedBox(width: 5),
                          Text('Pengeluaran', style: TextStyle(color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Text('Rp38.350.500', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}