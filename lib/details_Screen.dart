import 'package:flutter/material.dart';

class MovieDetailsScreen extends StatelessWidget {
  final dynamic movie;

  const MovieDetailsScreen({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(221, 35, 33, 33),
      appBar: AppBar(
        title: Text(movie['name'] ?? 'Details'),
        backgroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                movie['image'] != null ? movie['image']['original'] : '',
                height: 400.0,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 16.0),
              Text(
                movie['name'] ?? 'N/A',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(245, 230, 230, 235),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(
                            color: Color.fromARGB(245, 158, 158, 168)))),
                onPressed: () {},
                child: const Text(
                  'Play',
                  style: TextStyle(fontSize: 17, color: Colors.black),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                movie['summary'] != null
                    ? movie['summary'].replaceAll(RegExp(r'<[^>]*>'), '')
                    : 'No summary available',
                style: const TextStyle(fontSize: 16.0, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
