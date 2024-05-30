// CALCULADORA CON FUNCIONES
import 'dart:io';

void main(){

  // Map Clientes = {
  //   'Cedula' : '1001',
  //   'Nombre': 'Cristian',
  //   'Apellido':'Argaez',
  //   'Dirección':'CRA 48A',
  //   'Teléfono':'3232876654'

  // };

  // Map Proveedores = {
  //   'Empresa':'Colanta',
  //   'Dirección':'Avenida COROZAL'
  // };

  // print("\n$Clientes\n");
  // print("\n$Proveedores\n");
  bool bandera = true;

  while(bandera){
    print("\tCALCULADORA\n ¿Qué operación deseas realizar? \n1. SUMA \n2. RESTA \n3. MULTIPLICACIÓN \n4. DIVISIÓN \n5. SALIR");
    int opcion = int.parse(stdin.readLineSync()!);

    switch(opcion){
      case 1:
        print("\n El resulatdo es: ${SUMA()} \n");
        break;
      case 2:
          print("\nEl resulatdo es: ${RESTA()} \n");
        break;
      case 3:
        print("El resulatdo es: ${MULTIPLICACION()}\n");
        break;
      case 4:
        print("El resulatdo es: ${DIVISION()}\n");
        break;
      case 5:
        bandera = false;
    }
  }
}

int SUMA(){
  print("Ingrese el primer número");
  int numero1 = int.parse(stdin.readLineSync()!);

  print("Ingrese el segundo número");
  int numero2 = int.parse(stdin.readLineSync()!);

  int resultado = numero1 + numero2;
  return resultado;
}

int RESTA(){
  print("Ingrese el primer número");
  int numero1 = int.parse(stdin.readLineSync()!);

  print("Ingrese el segundo número");
  int numero2 = int.parse(stdin.readLineSync()!);

  int resultado = numero1 - numero2;
  return resultado;
}

int MULTIPLICACION(){
  print("Ingrese el primer número");
  int numero1 = int.parse(stdin.readLineSync()!);

  print("Ingrese el segundo número");
  int numero2 = int.parse(stdin.readLineSync()!);

  int resultado = numero1 * numero2;
  return resultado;
}

double DIVISION(){
  print("Ingrese el primer número");
  int numero1 = int.parse(stdin.readLineSync()!);

  print("Ingrese el segundo número");
  int numero2 = int.parse(stdin.readLineSync()!);

  double resultado = numero1 / numero2;
  return resultado;
}
