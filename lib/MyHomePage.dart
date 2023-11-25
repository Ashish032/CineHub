import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project/details_Screen.dart';
import 'package:project/search_Screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  List<dynamic> shows = [];

  @override
  void initState() {
    super.initState();
    fetchShows();
  }

  Future<void> fetchShows() async {
    final response =
        await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=all'));

    if (response.statusCode == 200) {
      setState(() {
        shows = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load shows');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(221, 35, 33, 33),
      appBar: AppBar(
        title: const Text(
          'MovieSphere',
          style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black87,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SearchScreen()));
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: shows.length,
        itemBuilder: (context, index) {
          var show = shows[index]['show'];
          var thumbnail =
              show['image'] != null ? show['image']['medium'] : null;

          return Card(
            color: const Color.fromARGB(221, 35, 33, 33),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16.0),
              leading: thumbnail != null
                  ? Container(
                      width: 120.0,
                      height: 120.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: NetworkImage(thumbnail),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              title: Text(show['name'],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white)),
              subtitle: Text(
                show['summary'] != null
                    ? show['summary']
                        .replaceAll(RegExp(r'<[^>]*>'), '') // Remove HTML tags
                    : 'No summary available',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                //Navigate to the detail screen with selected movie
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MovieDetailsScreen(movie: show)));
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black87,
        selectedFontSize: 14,
        unselectedFontSize: 12.0,
        selectedLabelStyle: const TextStyle(fontSize: 15, color: Colors.white),
        selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/image/home.png',
              height: 30,
            ),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/image/download.png',
              height: 30,
            ),
            label: 'Download',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/image/account.png',
              height: 30,
              //color: Colors.white,
            ),
            label: 'Account',
          )
        ],
      ),
    );
  }
}
