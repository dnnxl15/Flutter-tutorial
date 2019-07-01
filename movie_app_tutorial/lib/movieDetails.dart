import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './models/movieDetailsModel.dart';
import './models/movieModel.dart';
import 'package:intl/intl.dart';

const baseUrl = "https://api.themoviedb.org/3/movie/";
const baseImageUrl = "https://image.tmdb.org/t/p/";
const apiKey = "07736e6b473c0932b534644dcb2e9554";

class MovieDetail extends StatefulWidget {
  final Results movie;
  MovieDetail(this.movie);

  @override
  _MovieDetails createState() => new _MovieDetails();
}

class _MovieDetails extends State<MovieDetail> {
  String movieDetailUrl;
  MovieDetailModel movieDetails;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieDetailUrl = "$baseUrl${widget.movie.id}?api_key=$apiKey";
    _fetchMovieDetails();
  }

  void _fetchMovieDetails() async {
    var response = await http.get(movieDetailUrl);
    var decodedJson = jsonDecode(response.body);
    setState(() {
      movieDetails = MovieDetailModel.fromJson(decodedJson);
    });
  }

  @override
  Widget build(BuildContext context) {

    final moviePoster = Container(height: 350.0,padding: EdgeInsets.only(top:8.0, bottom: 8.0),child: Card(
      elevation: 15.0, child: Hero(
        tag: widget.movie.heroTag,
        child: Image.network("${baseImageUrl}w342${widget.movie.posterPath}"),
      ),
    ),);


    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: Text("Movies App",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold)),
        ),
        body: ListView(
          children: <Widget>[
            Container(color: Colors.purple),
          ],
        ));
  }
}
