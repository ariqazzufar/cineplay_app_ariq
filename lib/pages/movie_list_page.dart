import 'package:flutter/material.dart';
import 'detail_movie_page.dart';

class MovieListPage extends StatelessWidget {
  const MovieListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> movies = [
      {'title': 'Avatar 3', 'genre': 'Sci-Fi, Action', 'rating': '8.5/10', 'synopsis': 'Melanjutkan petualangan epik di planet Pandora.'},
      {'title': 'Spider-Man', 'genre': 'Action, Adventure', 'rating': '9.0/10', 'synopsis': 'Pahlawan laba-laba kembali beraksi melindungi kota.'},
      {'title': 'Inception', 'genre': 'Sci-Fi, Thriller', 'rating': '8.8/10', 'synopsis': 'Pencurian rahasia melalui alam bawah sadar (mimpi).'},
      {'title': 'Resident Evil', 'genre': 'Horror, Action', 'rating': '7.2/10', 'synopsis': 'Bertahan hidup dari serangan zombie mengerikan.'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Film Tayang')),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          // Rubrik 3: Menggunakan GestureDetector
          return GestureDetector(
            onTap: () {
              // Rubrik 3: Passing data via constructor
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailMoviePage(
                    title: movie['title'],
                    genre: movie['genre'],
                    rating: movie['rating'],
                    synopsis: movie['synopsis'],
                  ),
                ),
              );
            },
            child: Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: const Icon(Icons.movie_filter, size: 40),
                title: Text(movie['title'], style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('${movie['genre']} • ${movie['rating']}'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              ),
            ),
          );
        },
      ),
    );
  }
}