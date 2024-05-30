// ignore_for_file: camel_case_types

import 'package:curriculumvitae/widgets/Card.dart';
import 'package:curriculumvitae/widgets/Certificaciones.dart';
import 'package:flutter/material.dart';

class educacion extends StatefulWidget {
  const educacion({super.key});

  @override
  State<educacion> createState() => _educacionState();
}

class _educacionState extends State<educacion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 40.0, bottom: 20.0, left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(15.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xff1F1F1F),
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                        color: const Color.fromARGB(43, 155, 39, 176)),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Educación',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Card2(
                        colorIcon: Color.fromARGB(255, 209, 206, 50),
                        titulo:
                            'Tecnólogo en Análisis y Desarrollo de Software',
                        institucion: 'Servicio Nacional de Aprendizaje',
                        fecha: '2023 - presente',
                      ),
                      Card2(
                        colorIcon: Colors.deepOrange,
                        titulo: 'Técnico en Desarrollo de Software',
                        institucion: 'Servicio Nacional de Aprendizaje',
                        fecha: '2021 - 2022',
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 20.0),
                
                Container(
                  padding: const EdgeInsets.all(20.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xff1F1F1F),
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: const Color.fromARGB(43, 155, 39, 176),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Conocimientos',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Certificaciones(titulo: 'C++', fecha: '2021'),
                            Certificaciones(titulo: 'JAVA', fecha: '2023'),
                            Certificaciones(titulo: 'Laravel', fecha: '2023'),
                            Certificaciones(titulo: 'MySQL', fecha: '2022')
                          ],
                        ),
                      ),
                      SizedBox(width: 20.0), // Espacio entre las columnas
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 50.0),
                            Certificaciones(titulo: 'HTML - CSS', fecha: '2021'),
                            Certificaciones(titulo: 'JavaScript', fecha: '2023'),
                            Certificaciones(titulo: 'Flutter', fecha: '2024'),
                            Certificaciones(titulo: 'SQL Sever', fecha: '2023')
                          ],
                        ),
                      ),
                    ],
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

class InterestChip extends StatelessWidget {
  final String text;
  const InterestChip({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: Colors.purple.shade700,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: const Color.fromARGB(43, 155, 39, 176))),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 15),
      ),
    );
  }
}
