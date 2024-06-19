import 'package:flutter/material.dart';
import 'package:taller/screens/Pelicula.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class DetallePeliculaPage extends StatelessWidget {
  final Pelicula pelicula;

  DetallePeliculaPage({required this.pelicula});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pelicula.titulo),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(pelicula.imagenUrl),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      pelicula.titulo,
                      style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      pelicula.genero,
                      style: TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic, color: Colors.blueGrey),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      pelicula.descripcion,
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                child: YoutubePlayer(
                  controller: YoutubePlayerController(
                    initialVideoId: YoutubePlayer.convertUrlToId(pelicula.videoUrl)!,
                    flags: YoutubePlayerFlags(
                      autoPlay: false,
                      mute: false,
                    ),
                  ),
                  showVideoProgressIndicator: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
