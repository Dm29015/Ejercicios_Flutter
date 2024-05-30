// LISTA DE MUJERES Y HOMBRES

import 'dart:io';
void main(){

  List <String> listaF = [];
  List <String> listaM = [];
  List <String> nombrePersonas = [];

  print("Cantidad de personas a ingrear: ");
  int cantidadP = int.parse(stdin.readLineSync()!);

  for (var i = 0; i < cantidadP; i++) {
    print("Ingrese su nombre: ");String nombre = stdin.readLineSync()!;
    

    print("Ingrese su género F o M: ");
    String genero = stdin.readLineSync()!;

    nombrePersonas.add(nombre);

    switch (genero) {

      case 'F' || 'f':
        listaF.add(genero);
        break;

      case 'M' || 'm':
        listaM.add(genero);
        break;

      default:
        print("Ingrese un género válido.");
        break;
    }
    print("------------------------- ");
  }

  print("\nLista de personas registradas: $nombrePersonas");
  print("De $cantidadP personas hay ${listaF.length} mujer(es) y ${listaM.length} hombre(s). \n");

}