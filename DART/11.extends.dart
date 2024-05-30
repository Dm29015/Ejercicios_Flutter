//

import 'dart:io';

void main() {
  List<Casa> casas = [];
  List<Apartamento> apartamentos = [];

  bool b = true;

  while (b) {
    print(
        "\n\tMENÚ \n¿QUÉ OPERACIÓN DESEA REALIZAR? \n1. Registrar casa \n2. Registrar apartamento \n3. Consultar viviendas disponibles \n4. Salir");
    int opcion = int.parse(stdin.readLineSync()!);

    switch (opcion) {
      case 1:
        Casa.registrarCasa(casas);
        break;
      case 2:
        Apartamento.registrarApartamento(apartamentos);
        break;
      case 3:
        Casa.listarCasas(casas);
        Apartamento.listarApartamentos(apartamentos);
        break;
      case 4:
        b = false;
        break;
      default:
        print("Opción incorrecta");
        break;
    }
  }
}

class Inmueble {
  String _Direccion;
  double _valorArriendo;
  double _valorVenta;

  get Direccion => this._Direccion;
  set Direccion(value) => this._Direccion = value;

  get valorArriendo => this._valorArriendo;
  set valorArriendo(value) => this._valorArriendo = value;

  get valorVenta => this._valorVenta;
  set valorVenta(value) => this._valorVenta = value;

  Inmueble2() {
    _Direccion = '';
    _valorArriendo = 0.0;
    _valorVenta = 0.0;
  }

  Inmueble(this._Direccion, this._valorArriendo, this._valorVenta);
}

class Casa extends Inmueble {
  bool _Garage;

  Casa(String direccion, double valorArriendo, double valorVenta, this._Garage)
      : super(direccion, valorArriendo, valorVenta);

  static void registrarCasa(List<Casa> casas) {
    print("Ingrese la dirección");
    String direccion = stdin.readLineSync()!;

    int opcion;
    bool garage = false;
    do {
      print("¿Cuenta con garage? \n1. SI \n2. NO");
      opcion = int.parse(stdin.readLineSync()!);

      if (opcion == 1) {
        garage = true;
        break;
      } else if (opcion == 2) {
        garage = false;
        break;
      } else {
        print("\nOpción incorrecta, por favor digite una opción válida");
      }
    } while (opcion != 1 && opcion != 2);

    print("Ingrese el valor del arriendo");
    double valorArriendo = double.parse(stdin.readLineSync()!);

    print("Ingrese el valor de venta");
    double valorVenta = double.parse(stdin.readLineSync()!);

    if (valorVenta < 0 || valorArriendo < 0) {
      print("\nEl precio no puede ser inferior a 0");
    } else {
      Casa casa = Casa(direccion, valorArriendo, valorVenta, garage);
      casas.add(casa);
      print("\n\n¡Registro exitoso!");
    }
  }

  static void listarCasas(List<Casa> casas) {
    if (casas.isEmpty) {
      print("\nNo hay casas registradas");
    } else {
      print("\nDIRECCIÓN\tGARAGE\t\tARRIENDO \tVENTA");
      for (var c in casas) {
        print(c);
      }
    }
  }

  @override
  String toString() {
    return '\n\t${this._Direccion}\t ${_Garage} \t\t${_valorArriendo} \t\t${_valorVenta}';
  }
}

class Apartamento extends Inmueble {
  Apartamento(String Direccion, double valorArriendo, double valorVenta)
      : super(Direccion, valorArriendo, valorVenta);

  static void registrarApartamento(List<Apartamento> apartamentos) {
    print("Ingrese la dirección");
    String direccion = stdin.readLineSync()!;

    print("Ingrese el valor del arriendo");
    double valorArriendo = double.parse(stdin.readLineSync()!);

    print("Ingrese el valor de venta");
    double valorVenta = double.parse(stdin.readLineSync()!);

    if (valorVenta < 0 || valorArriendo < 0) {
      print("El precio no puede ser inferior a 0");
    } else {
      Apartamento apartamento =
          Apartamento(direccion, valorArriendo, valorVenta);
      apartamentos.add(apartamento);
      print("\n\n¡Registro exitoso!");
    }
  }

  static void listarApartamentos(List<Apartamento> apartamentos) {
    if (apartamentos.isEmpty) {
      print("\n--------------------------------------------------------\nNo hay apartamentos registrados");
    } else {
      print("\n--------------------------------------------------------\nDIRECCIÓN \tARRIENDO \tVENTA");
      for (var a in apartamentos) {
        print(a);
      }
    }
  }

  @override
  String toString() {
    return '\n\t ${this._Direccion}\t ${_valorArriendo}\t\t${_valorVenta}';
  }
}
