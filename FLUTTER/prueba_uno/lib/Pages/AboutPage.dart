// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:prueba_uno/Widgets/ProgressBarCustom.dart';
import 'package:flutter/material.dart';

import 'package:prueba_uno/Widgets/CardTop.dart';
import 'package:prueba_uno/Pages/EducationPage.dart';
import 'package:prueba_uno/Pages/ExperiencePage.dart';


class AboutMePage extends StatelessWidget
{

 @override
 Widget build(BuildContext context)
 {
    return Scaffold(
      backgroundColor: const Color(0xff040305),
      appBar: AppBar(
        backgroundColor: const Color(0xff040305),
        elevation: 0,
        title: const Text('About Me', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CardTop(icon: Icons.person_outline_rounded, text: 'About Me', isColor: true, page: AboutMePage(),),
                    CardTop(icon: Icons.work_outline_outlined, text: 'Experience', isColor: false, page: ExperiencePage()),
                    CardTop(icon: Icons.stacked_line_chart_sharp, text: 'Education', isColor: false, page: EducationPage()),
                  ],
                ),

                const SizedBox(height: 15.0),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xff1F1E25),
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Skills', style: TextStyle(color: Colors.white, fontSize: 18)),
                      SizedBox(height: 30.0),
                      ProgressBarCustom(skill: 'Backend Developer', porcentaje: '95',color: Color(0xffA36FF6)),
                      ProgressBarCustom(skill: 'Web Developer', porcentaje: '80',color: Color(0xff83DBC5), barra: 250),
                      ProgressBarCustom(skill: 'Flutter', porcentaje: '75',color: Color(0xff0385DC), barra: 210),
                      ProgressBarCustom(skill: 'Laravel', porcentaje: '80',color: Color(0xffF7605D), barra: 250),
                    ],
                  ),
                ),
 
                const SizedBox(height: 15.0),
                const Text('Interests', style: TextStyle(color: Colors.white, fontSize: 18)),
                const SizedBox(height: 15.0),

                Column(
                  children: [
                    Row(children: [
                      Container(
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: const Color(0xff1F1E25),
                          borderRadius: BorderRadius.circular(20.0)
                        ),
                        child: const Text('Fullstack Developer', style: TextStyle(color: Colors.white, fontSize: 15)),
                      ),
                      const SizedBox(width: 10.0),
                      Container(
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: const Color(0xff1F1E25),
                          borderRadius: BorderRadius.circular(20.0)
                        ),
                        child: const Text('Fullstack Developer', style: TextStyle(color: Colors.white, fontSize: 15)),
                      )
                    ])
                  ],
                )

            ],
          ),
        ),
      ),
     );
  }
}


