// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';

class Pelicula {
  final String titulo;
  final String imagenUrl;
  final String genero;
  final String descripcion;
  final String videoUrl;

  Pelicula({
    required this.titulo,
    required this.imagenUrl,
    required this.genero,
    required this.descripcion,
    required this.videoUrl,
  });

  factory Pelicula.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Pelicula(
      titulo: data['titulo'] ?? '',
      imagenUrl: data['imagenUrl'] ?? '',
      genero: data['genero'] ?? '',
      descripcion: data['descripcion'] ?? '',
      videoUrl: data['videoUrl'] ?? '',
    );
  }
}
