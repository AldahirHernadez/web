import 'package:flutter/material.dart';

import 'SoporteGerente/gerente.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String id = "login_page";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String validador = "";

  final usuario = TextEditingController();

  final departamento = TextEditingController();

  String nombre = '';

  String area = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/imagenes/Wallpapers_ADH_HTCA.jpg'),
                fit: BoxFit.fitHeight),
          ),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 5,
              ),
              Image.asset(
                'assets/imagenes/ATPM.JPG',
                width: 115.0,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Bienvenidos\nAl Soporte de IT".toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Impact',
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: usuario,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person_outline),
                    labelText: 'Nombre',
                    hintText: 'Jesús Aldahir Hernández Yáñez',
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: departamento,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.home_work),
                    labelText: 'Departamento',
                    hintText: 'Sistemas',
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              _buttonSignUp(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttonSignUp() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 70.0,
        vertical: 10.0,
      ),
      child: Wrap(
        spacing: 10.0,
        children: [
          ElevatedButton(
              onPressed: () {
                nombre = usuario.text;
                area = departamento.text;

                // ignore: unnecessary_new

                if (nombre == validador || area == validador) {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const AlertDialog(
                          title: Text("Parametros vacios"),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: [
                                Text("Verifique los campos vacios"),
                              ],
                            ),
                          ),
                        );
                      });
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Gerente(nombre, area)));
                }
              },
              child: const Text('Entrar')),
        ],
      ),
    );
  }
}
