import 'package:flutter/material.dart';

class DetailMoviePage extends StatelessWidget {
  // Rubrik 3: Menerima data dari Constructor
  final String title;
  final String genre;
  final String rating;
  final String synopsis;

  const DetailMoviePage({
    super.key,
    required this.title,
    required this.genre,
    required this.rating,
    required this.synopsis,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.grey[300],
              child: const Icon(Icons.image, size: 100, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Text(title, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Genre: $genre', style: const TextStyle(fontSize: 16, color: Colors.blueAccent)),
            Text('Rating: $rating', style: const TextStyle(fontSize: 16)),
            const Divider(height: 32, thickness: 1),
            const Text('Sinopsis:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(synopsis, style: const TextStyle(fontSize: 16)),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
              onPressed: () {
                Navigator.pop(context); // Kembali
              },
              child: const Text('Kembali'),
            )
          ],
        ),
      ),
    );
  }
}