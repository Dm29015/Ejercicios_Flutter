// Crear una clase de su proyecto que permita mostrar un mensaje cuando se vayan a registrar los datos, es decir, debe tener un método para registrar
import 'dart:io';

void main() {
  List<Clientes> clientes = [];

  bool bandera = true;
  while (bandera) {
    print(
        "\t\nMENÚ \nSeleccione una opción: \n1. Registrar un nuevo cliente \n2. Consultar registros \n3. Salir");

    int opcion = int.parse(stdin.readLineSync()!);

    switch (opcion) {
      case 1:
        registrarNuevoCliente(clientes);
        break;
      case 2:
        consultarRegistros(clientes);
        break;
      case 3:
        bandera = false;
        break;
      default:
        print("Seleccione una opción válida");
    }
  }
}

class Clientes {
  String? Documento;
  String? Nombre;
  String? Apellido;
  String? Direccion;
  String? Telefono;

  Clientes(this.Documento, this.Nombre, this.Apellido, this.Direccion,
      this.Telefono);

  @override
  String toString() {
    return "Documento: $Documento \nNombre Completo: $Nombre $Apellido \nDirección: $Direccion \nTeléfono: $Telefono\n";
  }
}

void registrarNuevoCliente(List<Clientes> clientes) {
  print("\t\n NUEVO CLIENTE");
  print("Ingrese el documento:");
  String? documento = stdin.readLineSync();
  print("Ingrese el nombre:");
  String? nombre = stdin.readLineSync();
  print("Ingrese el apellido:");
  String? apellido = stdin.readLineSync();
  print("Ingrese la dirección:");
  String? direccion = stdin.readLineSync();
  print("Ingrese el teléfono:");
  String? telefono = stdin.readLineSync();

  Clientes nuevoCliente =
      Clientes(documento, nombre, apellido, direccion, telefono);
  clientes.add(nuevoCliente);

  print("\nRegistro éxitoso");
}

void consultarRegistros(List<Clientes> clientes) {
  if (clientes.isEmpty) {
    print("\nNo hay clientes registrados.");
  } else {
    print("\n\tClientes registrados");
    for (var c in clientes) {
      print(c);
    }
  }
}
