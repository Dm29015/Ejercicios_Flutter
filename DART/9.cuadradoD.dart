// DIBUJE UN CUADRADO

import 'dart:io';

void main() {
  print("Ingrese el ANCHO de la figura");

  int ancho = int.parse(stdin.readLineSync()!);

  print("Ingrese el LARGO de la figura");

  int largo = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < largo; i++) {
    for (int j = 0; j < ancho; j++) {
      stdout.write("° ");
    }

    stdout.write("\n");
  }

  print("---------------------------------------------");

  print("Ingrese el lado del cuadrado");

  int lado = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < lado; i++) {
    for (int j = 0; j < lado; j++) {
      stdout.write("* ");
    }

    stdout.write("\n");
  }
}
