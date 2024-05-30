// CRUD EN UNA LISTA

import 'dart:io';

void main() {
  
  List<String> Proveedores = ["Colanta", "Nescafé"];
  bool bandera = true;

  while (bandera) {
    print(
        "\tBIENVENIDO\n¿Qué operación desea realizar? \n1. Registrar un nuevo proveedor \n2. Consultar un proveedor \n3. Eliminar un proveedor \n4. Actualizar un proveedor\n");
    int opcion = int.parse(stdin.readLineSync()!);

    switch (opcion) {
      case 1:
        print("\n ${registrarProveedor(Proveedores)}");
        break;
      case 2:
        consultarProveedor(Proveedores);
        break;
      case 3:
        print("\n ${eliminarProveedor(Proveedores)}\n");
        break;
      case 4:
        print("\n ${actualizarProveedor(Proveedores)}\n");
        break;
      case 5:
        bandera = false;
    }
  }
}

List<String> registrarProveedor(List<String> Proveedores) {
  print("Ingrese el nombre del nuevo proveedor");
  String proveedor = stdin.readLineSync()!;

  Proveedores.add(proveedor);

  return Proveedores;
}

List<String> eliminarProveedor(List<String> Proveedores) {
  print("Ingrese el nombre del proveedor que desea eliminar");
  String proveedor = stdin.readLineSync()!;

  Proveedores.remove(proveedor);

  return Proveedores;
}

List<String> actualizarProveedor(List<String> Proveedores) {
  print("Ingrese el nombre del proveedor que desea actualizar");
  String proveedor = stdin.readLineSync()!;

  int indice = Proveedores.indexOf(proveedor);

  if (indice > 0) {
    print("Ingrese el nuevo nombre del proveedor");
    String proveedorN = stdin.readLineSync()!;

    Proveedores[indice] = proveedorN;

    print("Proveedor actualizado exitosamente");
  } else {
    print("El proveedor no existe");
  }

  return Proveedores;
}

void consultarProveedor(List<String> Proveedores) {

  bool encontrado = false;

  print("Ingrese el nombre del proveedor que desea consultar");
  String proveedor = stdin.readLineSync()!;

  for (var e in Proveedores) {
    if (e == proveedor) {
      print("El proveedor ${proveedor} está en la lista.");
      encontrado = true;
    }
  }

  if (!encontrado){
    print("\nEl proveedor no está en la lista.");
  }
  
}
