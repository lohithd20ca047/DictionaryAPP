import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var searchController = TextEditingController();

  final dictionaryUrl = 'https://api.dictionaryapi.dev/api/v2/entries/en';

  var result;

//path
  String pathTravel() {
    var url = dictionaryUrl;
    var urlObj = '$url/$searchController';
    return urlObj;
  }

  Future getResult() async {
    var dio = Dio();

    var response = await dio.get(pathTravel());

    if (response.statusCode == 200) {
      setState(() {
        result = Card(
          child: Column(
            children: [
              Text(response.data['word']),
              Text(response.data['phonetic']),
              Text(response.data['origin']),
            ],
          ),
        );
      });
    } else {
      debugPrint('Error ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          toolbarHeight: 90,
          foregroundColor: Colors.deepPurple,
          title: Center(
              child: Text(
            'DICTIONARY',
            style: GoogleFonts.abel(
              fontSize: 60,
              color: Color.fromARGB(255, 224, 61, 115),
              fontWeight: FontWeight.bold,
            ),
          )),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://iphoneswallpapers.com/wp-content/uploads/2021/10/Wood-Neon-Phone-Background-iPhone-Wallpaper.jpg'),
                    fit: BoxFit.cover,
                    opacity: 0.8)),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(width: 2.0),
                        ),
                        hintText: 'Enter The Text',
                        prefixIcon: IconButton(
                          icon: const Icon(
                            Icons.search,
                            size: 30.0,
                          ),
                          onPressed: () {
                            setState(() {
                              getResult();
                            });
                          },
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {},
                        )),
                    controller: searchController,
                  ),
                )
              ],
            )));
  }
}
