import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  List<dynamic> searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(221, 35, 33, 33),
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: TextField(
          controller: searchController,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: 'Search movies',
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              searchMovies();
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: searchResults.length,
        itemBuilder: (context, index) {
          final movie = searchResults[index]['show'];
          return ListTile(
            leading: Image.network(movie['image']['medium']),
            title: Text(
              movie['name'],
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              movie['summary'],
              style: const TextStyle(color: Colors.white),
              maxLines: 1,
            ),
            onTap: () {
              Navigator.pushNamed(context, '/details', arguments: movie);
            },
          );
        },
      ),
    );
  }

  Future<void> searchMovies() async {
    final searchTerm = searchController.text;
    final Uri uri =
        Uri.parse('https://api.tvmaze.com/search/shows?q=$searchTerm');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      setState(() {
        searchResults = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to search movies');
    }
  }
}
