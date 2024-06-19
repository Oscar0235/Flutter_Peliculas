import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taller/screens/Agregar_page.dart';
import 'package:taller/screens/Detalle_pelicula_page.dart';
import 'package:taller/screens/Pelicula.dart';
// ignore: unused_import
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class CatalogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catálogo de Películas'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>AddMoviePage ()),
              );
            },
          ),
        ],
      ),
      body: _buildCatalog(),
    );
  }

  Widget _buildCatalog() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('peliculas').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        final peliculas = snapshot.data!.docs.map((doc) => Pelicula.fromFirestore(doc)).toList();

        return SingleChildScrollView(
          child: Container(
            color: Colors.black,
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildSection("Terror", peliculas.where((p) => p.genero == 'Terror').toList()),
                SizedBox(height: 16.0),
                _buildSection("Acción", peliculas.where((p) => p.genero == 'Acción').toList()),
                SizedBox(height: 16.0),
                _buildSection("Comedia", peliculas.where((p) => p.genero == 'Comedia').toList()),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSection(String title, List<Pelicula> peliculas) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(height: 8.0),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.75,
          ),
          itemCount: peliculas.length,
          itemBuilder: (context, index) {
            final pelicula = peliculas[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetallePeliculaPage(pelicula: pelicula),
                  ),
                );
              },
              child: Card(
                color: Colors.grey[900],
                elevation: 6.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
                        child: Image.network(
                          pelicula.imagenUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        pelicula.titulo,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                      child: Text(
                        pelicula.genero,
                        style: TextStyle(fontSize: 16.0, color: Colors.grey[400]),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
