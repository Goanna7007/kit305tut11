import 'package:flutter/material.dart';
import 'package:kit305tut11/movie.dart';
import 'package:provider/provider.dart';

import 'movie_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MovieModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'List Tutorial'),
      ),
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
  @override
  Widget build(BuildContext context) {
    return Consumer<MovieModel>(builder: buildScaffold);
  }

  Scaffold buildScaffold(BuildContext context, MovieModel movieModel, _) {
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
                    var movie = movieModel.items[index];
                    final image = movie.image;
                    return ListTile(
                      title: Text(movie.title),
                      subtitle: Text(movie.year.toString() +
                          " - " +
                          movie.duration.toString() +
                          " Hours"),
                      leading: image != null ? Image.network(image) : null,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MovieDetails(id: index);
                        }));
                      },
                    );
                  },
                  itemCount: movieModel.items.length),
            )
          ],
        ),
      ),
    );
  }
}
