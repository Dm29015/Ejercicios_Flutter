// ignore_for_file: camel_case_types

import 'package:curriculumvitae/widgets/CardWidget.dart';
import 'package:flutter/material.dart';

class experiencia extends StatefulWidget {
  const experiencia({super.key});

  @override
  State<experiencia> createState() => _experienciaState();
}

class _experienciaState extends State<experiencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(20.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xff121212),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Experiencia Laboral',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20.0),
                    CardWidget(
                      colorIcon: Color(0xffA36FF6),
                      cargo: 'ComerciPlus',
                      empresa: 'SENA',
                      fecha: '2023 - presente',
                      descripcion:
                          'Desarrollo de aplicativo web/movil para administrar un negocio.',
                    ),
                    CardWidget(
                      colorIcon: Color(0xff83DBC5),
                      cargo: 'A SAFE PLACE',
                      empresa: 'SENA',
                      fecha: '2021 - 2022',
                      descripcion:
                          'Creación de página web responsive.',
                    ),
                    CardWidget(
                      colorIcon: Color.fromARGB(255, 209, 206, 50),
                      cargo: 'AsoComunal',
                      empresa: 'HACKATHON',
                      fecha: '2022',
                      descripcion:
                          'Desarrollo de proyecto web ganador del HACKATHON ',
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
