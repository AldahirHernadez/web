// ignore_for_file: unused_local_variable, prefer_interpolation_to_compose_strings

import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Gerente extends StatelessWidget {
  final String nombre;
  final String area;
  Gerente(this.nombre, this.area, {super.key});

  var part1 = "http://10.17.40.208/atpm/setUsuarioAPI.php?usuario=";

  final ubicacion = TextEditingController();

  String gps = '';
  String prioridad = '';

  Future<void> tabla(String gps, String prioridad) async {
    this.gps = gps;

    this.prioridad = prioridad;

    String conjunto0 = "&area=";
    String conjunto1 = "&ubicacion=";
    String conjunto2 = "&prioridad=";

    var url = part1 +
        nombre +
        conjunto0 +
        area +
        conjunto1 +
        gps +
        conjunto2 +
        prioridad;
    var telegram =
        "https://api.telegram.org/bot6087462544:AAHUvhcYgaFDqg4Q3LWEq0hLW77gjrpEbC8/sendMessage?chat_id=-1001963531090&text=Nombre de Artelero:\n" +
            nombre +
            "\nDepartamento de:\n" +
            area +
            "\nSe encuentra en:\n" +
            gps +
            "\n";

    if (prioridad == '1') {
      telegram = telegram +
          "\ud83d\udd34" +
          "Se Necesita con Urgencia a Sistemas" +
          "\ud83d\udd34";
      //var response1 = await http.get(Uri.parse(telegram));
    } else if (prioridad == '2') {
      telegram = telegram +
          "\ud83d\udfe1" +
          "Se Necesita a Sistemas de Forma: Prioridad Normal" +
          "\ud83d\udfe1";
      var response1 = await http.get(Uri.parse(telegram));
    } else {
      telegram = telegram +
          "\ud83d\udfe2" +
          "Baja Prioridad, para acudir en cuanto se desocupen" +
          "\ud83d\udfe2";
      var response1 = await http.get(Uri.parse(telegram));
    }

    //var response = await http.get(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30.0,
                ),
                Image.asset(
                  'assets/imagenes/ATPM.JPG',
                  width: 130,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                const Text(
                  "Agregue su ubicación exacta \nSistemas se acercará",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Impact',
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: ubicacion,
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.location_history_rounded),
                      labelText: 'Ubicación',
                      hintText: 'Lugar donde se encuentra',

                      //padding( EdgeInsets.symmetric(horizontal: 15.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  "Que atencion requiere:",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                const Text(
                  "Urgente",
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
                _buttonUrgente(),
                const SizedBox(
                  height: 55.0,
                ),
                const Text(
                  "Proridad Normal",
                  style: TextStyle(color: Colors.yellow, fontSize: 12),
                ),
                _buttonNormal(),
                const SizedBox(
                  height: 55.0,
                ),
                const Text(
                  "Baja Prioridad",
                  style: TextStyle(color: Colors.green, fontSize: 12),
                ),
                _buttonBaja(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttonUrgente() {
    return Center(
      child: Wrap(
        spacing: 15,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                visualDensity:
                    const VisualDensity(vertical: ln10, horizontal: sqrt1_2)),
            child: const Icon(
              Icons.circle,
              color: Colors.transparent,
              size: 55,
            ),

            onPressed: () {
              gps = ubicacion.text;
              tabla(gps, '1');

              //Navigator.push(BuildContext as BuildContext,
              //MaterialPageRoute(builder: (context) => const LoginPage()));

              /*showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const AlertDialog(
                      title: Text("Se acerca ya personal de sistemas"),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: [
                            Text(
                                "Ha oprimido el boton de urgencia, se atendera de inmediato")
                          ],
                        ),
                      ),
                    );
                  });*/
              const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.red));
            },
            //tooltip: 'Urgente',
          ),
        ],
      ),
    );
  }

  Widget _buttonNormal() {
    return Center(
      child: Wrap(
        spacing: 15.0,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                visualDensity:
                    const VisualDensity(vertical: ln10, horizontal: sqrt1_2)),
            child: const Icon(
              Icons.circle,
              color: Colors.transparent,
              size: 55,
            ),

            onPressed: () {
              gps = ubicacion.text;
              tabla(gps, '2');
              const AlertDialog(
                actions: [
                  Text('Se acerca sistemas en un aproximado de 15 min')
                ],
              );
              //Navigator.push(context as BuildContext,
              //  MaterialPageRoute(builder: (context) => const LoginPage()));
              /*showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const AlertDialog(
                      title: Text("Se acercará personal de sistemas"),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: [
                            Text(
                                "Ha oprimido el boton de prioridad normal, se atendera en un aproximado de 15 min")
                          ],
                        ),
                      ),
                    );
                  });*/
            },
            //tooltip: 'Atención Normal',
          ),
        ],
      ),
    );
  }

  Widget _buttonBaja() {
    return Center(
      child: Wrap(
        spacing: 15.0,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                visualDensity:
                    const VisualDensity(vertical: ln10, horizontal: sqrt1_2)),
            child: const Icon(
              Icons.circle,
              color: Colors.transparent,
              size: 55,
            ),
            onPressed: () {
              gps = ubicacion.text;
              tabla(gps, '3');
              //Navigator.push(context as BuildContext,
              //MaterialPageRoute(builder: (context) => const LoginPage()));

              /*showDialog(
                  context: context as BuildContext,
                  builder: (BuildContext context) {
                    return const AlertDialog(
                      title: Text("Petición enviada ha personal de sistemas"),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: [
                            Text(
                                "Ha oprimido el boton de baja prioridad, se atendera de 20 a 30 min")
                          ],
                        ),
                      ),
                    );
                  });*/
            },
            //tooltip: 'Baja Prioridad',
          ),
        ],
      ),
    );
  }
}
