import 'package:flutter/material.dart';

class DetailJadwalPage extends StatelessWidget {
  final String studioName;

  const DetailJadwalPage({super.key, required this.studioName});

  @override
  Widget build(BuildContext context) {
    final List<String> jamTayang = ['10:30 WIB', '13:00 WIB', '15:45 WIB', '19:15 WIB'];

    return Scaffold(
      appBar: AppBar(title: Text('Jadwal $studioName')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: jamTayang.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(jamTayang[index], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('Tersedia 20 kursi'),
              trailing: ElevatedButton(
                onPressed: () {
                  // Rubrik 4: Mengirim data kembali ke halaman sebelumnya
                  Navigator.pop(context, jamTayang[index]);
                },
                child: const Text('Pilih'),
              ),
            ),
          );
        },
      ),
    );
  }
}