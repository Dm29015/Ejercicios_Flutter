import 'package:comerciplus_flutter/pages/menu.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String API = "http://deisy77-001-site1.gtempurl.com/api/usuarios";

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';

  Future<void> autenticarUsuario(String username, String password) async {
    try {
      final response = await http.get(Uri.parse(API));
      if (response.statusCode == 200) {
        List<dynamic> usuarios = json.decode(response.body);

        bool isAuthenticated = false;
        for (var usuario in usuarios) {
          if (username == usuario['correo'] && password == usuario['clave']) {
            isAuthenticated = true;
          }
        }

        if (isAuthenticated) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Menu()),
          );
        } else {
          setState(() {
            _errorMessage = 'Correo o contraseña incorrectos';
          });
        }
      } else {
        setState(() {
          _errorMessage = 'Error al obtener usuarios: ${response.statusCode}';
        });
      }
    } catch (error) {
      setState(() {
        _errorMessage = 'Hubo un problema al iniciar sesión: $error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 42, 54, 68),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Iniciar Sesión',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(228, 255, 235, 59),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _emailController,
                  style: const TextStyle(color: Colors.yellow),
                  decoration: InputDecoration(
                    labelText: 'Correo',
                    labelStyle: const TextStyle(color: Color.fromRGBO(255, 214, 79, 0.644)),
                    prefixIcon: const Icon(Icons.email, color: Color.fromRGBO(255, 214, 79, 0.644)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.yellow),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.yellow),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _passwordController,
                  style: const TextStyle(color: Colors.yellow),
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    labelStyle: const TextStyle(color: Color.fromRGBO(255, 214, 79, 0.644)),
                    prefixIcon: const Icon(Icons.lock, color: Color.fromRGBO(255, 214, 79, 0.644)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color.fromRGBO(255, 213, 79, 1)),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.yellow),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final email = _emailController.text;
                  final password = _passwordController.text;
                  autenticarUsuario(email, password);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(255, 213, 79, 1),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50.0,
                    vertical: 15.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Iniciar sesión',
                  style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 42, 54, 68)),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                _errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
