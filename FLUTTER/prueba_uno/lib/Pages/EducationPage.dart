// ignore_for_file: file_names

import 'package:prueba_uno/Pages/AboutPage.dart';
import 'package:prueba_uno/Pages/ExperiencePage.dart';
import 'package:prueba_uno/Widgets/CardCustom.dart';
import 'package:prueba_uno/Widgets/CardTop.dart';
import 'package:flutter/material.dart';


class EducationPage extends StatelessWidget
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
            children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CardTop(icon: Icons.person_outline_rounded, text: 'About Me', isColor: false, page: AboutMePage()),
                    CardTop(icon: Icons.work_outline_outlined, text: 'Experience', isColor: false, page: ExperiencePage()),
                    CardTop(icon: Icons.stacked_line_chart_sharp, text: 'Education', isColor: true, page: EducationPage(),),
                  ],
                ),

                const SizedBox(height: 15.0),
                const CardCustom(text: 'Master in Backend Web',colorIcon: Color(0xffA36FF6), isEducation: true, education: '2014 - 2016 . University',),
                const CardCustom(text: 'Master in Laravel',colorIcon: Color(0xffA36FF6), isEducation: true, education: '2016 - 2018 . University',),
                const CardCustom(text: 'Bachiller in Sistemas',colorIcon: Color(0xffA36FF6), isEducation: true, education: '2019 - 2020 . University',),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width * 0.45,
                      decoration: BoxDecoration(
                        color: const Color(0xff1F1E25),
                        borderRadius: BorderRadius.circular(20.0)
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.star_border_outlined, color: Color(0xffA36FF6), size: 35),
                          SizedBox(height:5),
                          Text('Web Developer', style: TextStyle(color: Colors.white, fontSize: 16)),
                          SizedBox(height:5),
                          Text('2020', style: TextStyle(color: Colors.white, fontSize: 16)),
                        ],
                      ),
                    ),
                    Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width * 0.45,
                      decoration: BoxDecoration(
                        color: const Color(0xff1F1E25),
                        borderRadius: BorderRadius.circular(20.0)
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.star_border_outlined, color: Color(0xffA36FF6), size: 35),
                          SizedBox(height:5),
                          Text('App Developer', style: TextStyle(color: Colors.white, fontSize: 16)),
                          SizedBox(height:5),
                          Text('2021', style: TextStyle(color: Colors.white, fontSize: 16)),
                        ],
                      ),
                    )
                  ],
                )
            ],
          ),
        ),
      ),
     );
  }
}