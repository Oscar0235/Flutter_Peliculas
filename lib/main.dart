// ignore_for_file: prefer_const_constructors, use_super_parameters

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:taller/screens/LoginScreen.dart';
import 'package:taller/screens/RegistroScreen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Fire());
}

class Fire extends StatelessWidget {
  const Fire({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/img/saff.jpg'), 
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "¿Ya tienes cuenta? Presiona Login",
                  style: TextStyle(color: const Color.fromARGB(255, 229, 179, 179), fontSize: 20), 
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginApp()),
                    );
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 20), 
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "¿No tienes cuenta? Presiona en Registro",
                  style: TextStyle(color: Colors.white, fontSize: 20), 
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Registro()),
                    );
                  },
                  child: Text(
                    "Registro",
                    style: TextStyle(color: Colors.white, fontSize: 20), 
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
