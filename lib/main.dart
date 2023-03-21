import 'package:flutter/material.dart';
import 'package:search_system/model/movie_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  static List<MovieModel> main_movies_list = [
    MovieModel("The Shawshank Redemption", 1994, 9.3,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAHEq4IsQ-E7s-DzaY4wPOE123LgrDOTDSuw&usqp=CAU"),
    MovieModel("The Godfather", 1972, 9.2,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREMT6xkDx7q9lKG_skTdkzv3KPSa3EXqEfmg&usqp=CAU"),
    MovieModel("The Last Kingdom", 2016, 9.7,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyC6fRsBJPjktVou-iNPDwIZWEGKmSffrNow&usqp=CAU"),
    MovieModel("Vikings", 2011, 9.1,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoKRYGd8CCE-uFGMCo-q8jkq00OcD0IQNLgA&usqp=CAU"),
    MovieModel("12 Angry Men", 1957, 9.0,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDcy_NvejH_xFhF9ymD1n4HI3U8F6YEi4KcQ&usqp=CAU"),
    MovieModel("Schindler's List", 1993, 8.9,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTT3nWFQI1Ef-uNaaMpgd2fq_fTfSR_0vCqnw&usqp=CAU"),
    MovieModel("The Lord of the Rings", 2003, 8.8,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJzZcAstr--InOENrRo6oT-zTU2C4CNViv2Q&usqp=CAU"),
    MovieModel("Pulp Fiction", 1994, 8.9,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQD0uI4qNrbqozapaKp7iveDXz5XuB4wE_a7A&usqp=CAU"),
    MovieModel("Spartacus", 2010, 9.1,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThvrqeVbpIAr_X7-oeBJbhzkDVuqb9w5HaXQ&usqp=CAU"),
  ];

  List<MovieModel> display_list = List.from(main_movies_list);

  void updateList(String value) {
    setState(() {
      display_list = main_movies_list
          .where((element) =>
              element.movie_title!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1f1545),
      appBar: AppBar(
        backgroundColor: Color(0xFF1f1545),
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Search for a movie",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              onChanged: (value) => updateList(value),
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xff302360),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "eg: The Dark Knight",
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.purple.shade900,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(

              child: display_list.length == 0 ?Center(
                child: Text("No result found", 
                style: TextStyle(
                  color: Colors.white, 
                  fontSize: 22.0,
                  ),
                )
              ):
                ListView.builder(
                itemCount: display_list.length,
                itemBuilder: (context, index) => ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                  title: Text(
                    display_list[index].movie_title!,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    "${display_list[index].movie_release_year!}",
                    style: TextStyle(
                      color: Colors.white60,
                    ),
                  ),
                  trailing: Text(
                    "${display_list[index].rating}",
                    style: TextStyle(color: Colors.amber),
                  ),
                  leading: Image.network(display_list[index].movie_poster_url!),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
