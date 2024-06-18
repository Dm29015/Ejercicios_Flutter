// ignore_for_file: file_names
import 'package:flutter/material.dart';
import '../widgets/ProgressBarCustom.dart';

class InfoPersonal extends StatelessWidget {
  const InfoPersonal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0, bottom:20.0, left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                    color: const Color(0xff1F1F1F),
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                        color: const Color.fromARGB(43, 155, 39, 176))),
                
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                        'assets/images/señoraRandom.jpeg',
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.width * 0.3,
                        fit: BoxFit.cover,
                      ),
                    ),
                    
                    const SizedBox(width: 20.0),
                    
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Deisy Milena Correa Zabaleta',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Poseo la capacidad de aprender rápido, trabajar en equipo y buscar la resolución de problemas de manera eficiente',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              const Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: [
                    InterestChip(text: 'Scrum'),
                    InterestChip(text: 'Data Base'),
                    InterestChip(text: 'Backend Developer'),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: const Color(0xff1F1F1F),
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          color: const Color.fromARGB(43, 155, 39, 176),
                        ),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(
                            'Idiomas',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                           SizedBox(height: 30.0),
                           ProgressBarCustom(
                            skill: 'ESPAÑOL',
                            porcentaje: '90',
                            color: Color(0xffA36FF6),
                            barra: 90,
                          ),
                          ProgressBarCustom(
                            skill: 'INGLÉS',
                            porcentaje: '50',
                            color:  Color(0xff83DBC5),
                            barra: 50,
                          ),
                          ProgressBarCustom(
                            skill: 'Griego',
                            porcentaje: '30',
                            color:  Color(0xff0385DC),
                            barra: 30,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 15.0),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: const Color(0xff1F1F1F),
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          color: const Color.fromARGB(43, 155, 39, 176),
                        ),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Información Personal',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.calendar_month_outlined,
                                  color: Color.fromARGB(188, 255, 7, 201)),
                              SizedBox(width: 10.0),
                              Flexible(
                                child: Text(
                                  '29/01/2005',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15.0),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.email_outlined, color: Colors.blue),
                              SizedBox(width: 10.0),
                              Flexible(
                                child: Text(
                                  'deisyco2901@gmail.com',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15.0),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.phone_android_rounded,
                                  color: Colors.green),
                              SizedBox(width: 10.0),
                              Flexible(
                                child: Text(
                                  '3222500587',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15.0),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.location_on_outlined,
                                  color: Colors.red),
                              SizedBox(width: 10.0),
                              Flexible(
                                child: Text(
                                  'Medellín, Colombia',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
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
