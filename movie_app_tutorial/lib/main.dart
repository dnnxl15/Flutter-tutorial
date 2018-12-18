import 'package:flutter/material.dart'; //libreria de disenio de dart

//Punto de acceso de una app flutter
void Main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData.dark(),
      home: MyMovieApp(),
    ));

// creacion de StatefulWidget

class MyMovieApp extends StatefulWidget {
  @override
  _MyMovieApp createState() => new _MyMovieApp();
}

class _MyMovieApp extends State<MyMovieApp> {
  @override
  Widget build(BuildContext context) {
    // scaffold es un widget donde permite tener un barra principal arriba y un lienzo
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Movies App',
            style: TextStyle( //Estilos de texto para Movies App
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.bold)
        ),
        centerTitle: true,
      ),
    );
  }
}
