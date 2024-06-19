
// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  // ignore: prefer_const_constructors
  runApp(Registro());
}

class Registro extends StatelessWidget {
  // ignore: use_super_parameters
  const Registro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ignore: prefer_const_constructors
      home: Home(),
      theme: ThemeData(
        primaryColor: Colors.blue,
        hintColor: Colors.blueAccent,
        fontFamily: 'Roboto',
      ),
    );
  }
}

class Home extends StatefulWidget {
  // ignore: use_super_parameters
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // ignore: prefer_const_constructors
          BackgroundImage(
            // ignore: prefer_const_constructors
            imageProvider: AssetImage('lib/assets/img/RESG.jpg'),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Nickname(controller: _nicknameController),
                  // ignore: prefer_const_constructors
                  SizedBox(height: 20),
                  Gmail(controller: _emailController),
                  // ignore: prefer_const_constructors
                  SizedBox(height: 20),
                  Contrasenia(controller: _passwordController),
                  // ignore: prefer_const_constructors
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      String email = _emailController.text.trim();
                      String nickname = _nicknameController.text.trim();
                      String password = _passwordController.text.trim();

                      try {
                        final UserCredential userCredential =
                            await _auth.createUserWithEmailAndPassword(
                                email: email, password: password);

                        await _firestore
                            .collection('users')
                            .doc(userCredential.user!.uid)
                            .set({
                          'email': email,
                          'nickname': nickname,
                        });

                        _emailController.clear();
                        _nicknameController.clear();
                        _passwordController.clear();

                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          // ignore: prefer_const_constructors
                          SnackBar(
                            // ignore: prefer_const_constructors
                            content: Text('Registro exitoso'),
                          ),
                        );

                      } catch (e) {
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Error de registro: $e'),
                          ),
                        );
                      }
                    },
                    // ignore: prefer_const_constructors
                    child: Text('Registrar'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundImage extends StatelessWidget {
  final ImageProvider imageProvider;

  // ignore: use_key_in_widget_constructors
  const BackgroundImage({required this.imageProvider});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class Gmail extends StatelessWidget {
  final TextEditingController controller;

  // ignore: use_key_in_widget_constructors
  const Gmail({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: prefer_const_constructors
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Ingrese su Gmail',
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

class Contrasenia extends StatelessWidget {
  final TextEditingController controller;

  // ignore: use_key_in_widget_constructors
  const Contrasenia({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: prefer_const_constructors
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        controller: controller,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Ingrese Contraseña',
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

class Nickname extends StatelessWidget {
  final TextEditingController controller;

  // ignore: use_key_in_widget_constructors
  const Nickname({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: prefer_const_constructors
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Ingrese su Nickname',
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
