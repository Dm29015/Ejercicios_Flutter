
// Solicitar N cantidad de número por teclado. 
// Calcular máximo, mínimo valor, cantidad positivos, cantidad negativos, promedio de positivos, promedio de negativos

import 'dart:io';

void main() {
  int? minimo;
  int maximo = 0,
      sumaP = 0,
      sumaN = 0,
      positivos = 0,
      negativos = 0,
      bandera = 1,
      ejecucion;

  print("Ingrese la cantidad de números a ingresar:");

  ejecucion = int.parse(stdin.readLineSync()!);

  while (bandera <= ejecucion) {
    print("Ingrese un número:");

    int numero = int.parse(stdin.readLineSync()!);

    if (numero > 0) {
      positivos++;
      sumaP += numero;

    } else {
      negativos++;
      sumaN += numero;
    }

    if (minimo == null || numero < minimo) {
      minimo = numero;
    }

    if(numero > maximo){
      maximo = numero;
    }

    bandera++;
  }

  print(
      " Cantidad de números positivos: ${positivos} \n Cantidad de números negativos: ${negativos} \n");

  print(
    " Promedio de positivos: ${sumaP / positivos} \n Promedio Negativos: ${sumaN / negativos} \n");
  
  print(
      " Máximo valor: ${maximo} \t Mínimo valor: ${minimo} \n");
}
