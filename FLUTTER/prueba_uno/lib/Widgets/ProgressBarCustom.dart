// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';


class ProgressBarCustom extends StatelessWidget {

  final String skill;
  final String porcentaje;
  final Color color;
  final double barra;

  const ProgressBarCustom({required this.skill,required this.porcentaje,required this.color, this.barra = 300});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text( skill, style: const TextStyle(color: Colors.white, fontSize: 16)),
              Text('$porcentaje%', style: const TextStyle(color: Colors.white, fontSize: 16)),
            ],
          ),
          const SizedBox(height: 10.0),
          Stack(
            children: [
              Container(
              height: 9,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: Colors.white
                )
              ),
              Container(
                height: 9,
                width: barra,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: this.color
                ),
              ),

            ],
            ),
          
        ],
      ),
    );
  }
}
