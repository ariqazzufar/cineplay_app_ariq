import 'package:flutter/material.dart';
import 'detail_jadwal_page.dart';

class JadwalBioskopPage extends StatefulWidget {
  const JadwalBioskopPage({super.key});

  @override
  State<JadwalBioskopPage> createState() => _JadwalBioskopPageState();
}

class _JadwalBioskopPageState extends State<JadwalBioskopPage> {
  String _pesanTerpilih = "Belum ada jadwal dipilih";

  Future<void> _pilihJadwal(BuildContext context, String namaStudio) async {
    // Rubrik 4: Menggunakan await Navigator.push untuk menerima data kembalian
    final String? hasil = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailJadwalPage(studioName: namaStudio),
      ),
    );

    // Memperbarui UI jika pengguna memilih jadwal (tidak null)
    if (hasil != null && mounted) {
      setState(() {
        _pesanTerpilih = "Kamu memilih $namaStudio jam $hasil";
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Berhasil memilih: $hasil di $namaStudio')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> studios = ['Studio Regular', 'Studio IMAX 3D', 'Velvet VIP'];

    return Scaffold(
      appBar: AppBar(title: const Text('Jadwal Bioskop')),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            color: Colors.blueAccent.withOpacity(0.1),
            child: Text(
              _pesanTerpilih,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: studios.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.theaters),
                  title: Text(studios[index]),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () => _pilihJadwal(context, studios[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}