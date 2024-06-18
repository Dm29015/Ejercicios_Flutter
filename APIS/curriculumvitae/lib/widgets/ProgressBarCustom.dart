// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ProgressBarCustom extends StatelessWidget {
  final String skill;
  final String porcentaje;
  final Color color;
  final double barra;

  const ProgressBarCustom({super.key, 
    required this.skill,
    required this.porcentaje,
    required this.color,
    required this.barra,
  });

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
              Expanded(
                child: Text(
                  skill,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis, 
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Stack(
            children: [
              Container(
                height: 9,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.white,
                ),
              ),
              Container(
                height: 9,
                width: barra,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: color,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
