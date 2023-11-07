import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:aplicacion/services/auth.dart';
import 'package:aplicacion/services/globals.dart';
import 'package:aplicacion/components/rounded_button.dart';
import 'package:http/http.dart' as http;
import 'home_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 22, 78, 125),
      body: Center(
        child: Center(
          child: Text(
            'Usted ha iniciado sesión de forma correcta.',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = '';
  String _password = '';

  loginPressed() async {
    if (_email.isNotEmpty && _password.isNotEmpty) {
      http.Response response = await AuthServices.login(_email, _password);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const HomeScreen(),
            ));
      } else {
        errorSnackBar(context, 'LOS DATOS INGRESADOS SON INCORRECTOS');
      }
    } else {
      errorSnackBar(context, 'INGRESA TODOS LOS CAMPOS');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 87, 156, 230),
        centerTitle: false,
        elevation: 0,
        title: const Text(
          'App Conecta Mayor',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      backgroundColor: Colors
          .white, // Set the background color of the Scaffold's body to white.
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Image.network(
              'https://binfrix.com/template/dist/img/logo.jpg',
              height: 70,
            ),
            const SizedBox(height: 30),
            TextField(
              decoration: const InputDecoration(
                hintText: 'INGRESA TU CORREO',
                hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              onChanged: (value) {
                _email = value;
              },
            ),
            const SizedBox(height: 30),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'INGRESA TU CONTRASEÑA',
                hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              onChanged: (value) {
                _password = value;
              },
            ),
            const SizedBox(height: 30),
            RoundedButton(
              btnText: 'INGRESAR',
              onBtnPressed: () => loginPressed(),
            )
          ],
        ),
      ),
    );
  }
}
