import 'package:flutter/material.dart';
import 'package:kit305tut11/movie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'List Tutorial'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Movie> movies = [
    Movie(
        title: "Lord of the Rings",
        year: 2001,
        duration: 9001,
        image:
            "https://upload.wikimedia.org/wikipedia/en/8/8a/The_Lord_of_the_Rings_The_Fellowship_of_the_Ring_%282001%29.jpg"),
    Movie(
        title: "The Matrix",
        year: 1999,
        duration: 150,
        image:
            "https://upload.wikimedia.org/wikipedia/en/c/c1/The_Matrix_Poster.jpg")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                  itemBuilder: (_, index) {
                    var movie = movies[index];
                    final image = movie.image;
                    return ListTile(
                      title: Text(movie.title),
                      subtitle: Text(movie.year.toString() +
                          " - " +
                          movie.duration.toString() +
                          " Hours"),
                      leading: image != null ? Image.network(image) : null,
                    );
                  },
                  itemCount: movies.length),
            )
          ],
        ),
      ),
    );
  }
}
