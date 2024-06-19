import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taller/screens/Pelicula.dart';

// ignore: use_key_in_widget_constructors
class AddMoviePage extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _genreController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _videoUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Película'),
      ),
 
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          
            _buildTextField(_titleController, 'Título'),
            _buildTextField(_imageController, 'URL de la Imagen'),
            _buildTextField(_genreController, 'Género'),
            _buildTextField(_descriptionController, 'Descripción'),
            _buildTextField(_videoUrlController, 'URL de YouTube'),
            SizedBox(height: 20),
         
            ElevatedButton(
              onPressed: () {
                final pelicula = Pelicula(
                  titulo: _titleController.text,
                  imagenUrl: _imageController.text,
                  genero: _genreController.text,
                  descripcion: _descriptionController.text,
                  videoUrl: _videoUrlController.text,
                );

        
                FirebaseFirestore.instance.collection('peliculas').add({
                  'titulo': pelicula.titulo,
                  'imagenUrl': pelicula.imagenUrl,
                  'genero': pelicula.genero,
                  'descripcion': pelicula.descripcion,
                  'videoUrl': pelicula.videoUrl,
                });

              
                Navigator.pop(context);
              },
              child: Text('Agregar'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.0),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white), 
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.white70),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white), 
          ),
        ),
      ),
    );
  }
}
