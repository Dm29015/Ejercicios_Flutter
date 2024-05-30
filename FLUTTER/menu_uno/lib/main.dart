// ignore_for_file: camel_case_types

import 'package:clase14_05_2024/menu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const app());
}

class app extends StatefulWidget {
  const app({super.key});

  @override
  State<app>
  createState() => _appState();
}
 
class _appState extends State<app> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Menu(),
    );
  }
}
