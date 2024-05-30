import 'dart:io';

void main(List<String> args) {
  List<cuentaBancaria> cuentas = [];
  bool b = true;

  while (b) {
    print(
        "\n\tMENÚ \n1. Registrar Cuenta \n2. Consultar estado de cuenta \n3. Consignar dinero\n4. Transferir dinero\n5. Retirar dinero.\n6. Salir");
    int opcion = int.parse((stdin.readLineSync()!));

    switch (opcion) {
      case 1:
        cuentaBancaria.registrarCuenta(cuentas);
        break;
      case 2:
        cuentaBancaria.consultar(cuentas);
        break;
      case 3:
        cuentaBancaria.consignar(cuentas);
        break;
      case 4:
        cuentaBancaria.transferir(cuentas);
        break;
      case 5:
        cuentaBancaria.retirar(cuentas);
        break;
      case 6:
        b = false;
        break;
      default:
        print("\nOpción inválida");
    }
  }
}

class cuentaBancaria {
  int numerocuenta;
  double saldo = 0;

  cuentaBancaria(this.numerocuenta);

  static void registrarCuenta(List<cuentaBancaria> cuentas) {
    stdout.write("Ingrese el número de cuenta: ");
    int numerocuenta = int.parse(stdin.readLineSync()!);

    cuentaBancaria cuenta = cuentaBancaria(numerocuenta);
    cuentas.add(cuenta);
    print("\n¡Registro exitoso!");
  }

  static void consignar(List<cuentaBancaria> cuentas) {
    stdout.write("Ingrese el número de cuenta: ");
    int numerocuenta = int.parse(stdin.readLineSync()!);

    stdout.write("Ingrese la cantidad de dinero a consignar: ");
    double consignar = double.parse(stdin.readLineSync()!);

    for (var c in cuentas) {
      if (c.numerocuenta == numerocuenta) {
        c.saldo += consignar;
        print("\n¡Consignación éxitosa!");
      } else {
        print("\nLa cuenta ingresada no existe.");
      }
    }
  }

  static void consultar(List<cuentaBancaria> cuentas) {
    stdout.write("Ingrese el número de cuenta: ");
    int numerocuenta = int.parse(stdin.readLineSync()!);

    for (var c in cuentas) {
      if (c.numerocuenta == numerocuenta) {
        print(c);
        break;
      } else {
        print("\nLa cuenta no existe.");
      }
    }
  }

  static void retirar(List<cuentaBancaria> cuentas) {
    stdout.write("Ingrese el número de cuenta: ");
    int numerocuenta = int.parse(stdin.readLineSync()!);

    for (var c in cuentas) {
      if (c.numerocuenta == numerocuenta) {
        stdout.write("Ingrese la cantidad de dinero a retirar: ");
        double retiro = double.parse(stdin.readLineSync()!);

        if (retiro > c.saldo) {
          print("\nSaldo insuficuente.");
          break;
        } else if (retiro <= 0) {
          print("\nLa cantidad no puede ser igual o inferior a 0");
          break;
        } else {
          c.saldo -= retiro;
          print("¡Retiro éxitoso!");
          break;
        }
      } else {
        print("\nLa cuenta ingresada no existe.");
      }
    }
  }

  static void transferir(List<cuentaBancaria> cuentas) {
    stdout.write("Ingrese su número de cuenta: ");
    int numeroCuenta1 = int.parse(stdin.readLineSync()!);

    var cuenta1 = cuentas.firstWhere((c) => c.numerocuenta == numeroCuenta1,
        orElse: () => cuentaBancaria(0));
        
    if (cuenta1.numerocuenta == 0) {
      print("\nLa cuenta origen no existe.");
    } else {
      stdout.write("Ingrese la cantidad de dinero a transferir: ");
      double transferencia = double.parse(stdin.readLineSync()!);

      if (transferencia <= 0) {
        print("\nLa cantidad a transferir debe ser mayor que 0.");
      } else if (transferencia > cuenta1.saldo) {
        print("\nSaldo insuficiente.");
      } else {
        stdout.write("Ingrese el número de cuenta destino: ");
        int numeroCuenta2 = int.parse(stdin.readLineSync()!);

        var cuenta2 = cuentas.firstWhere((c) => c.numerocuenta == numeroCuenta2,
            orElse: () => cuentaBancaria(0));

        if (cuenta2.numerocuenta == 0) {
          print("\nLa cuenta destino no existe.");
        } else {
          cuenta1.saldo -= transferencia;
          cuenta2.saldo += transferencia;
          print("\n¡Transferencia exitosa!");
        }
      }
    }
  }

  @override
  String toString() {
    return '\n\tINFORMACIÓN DE LA CUENTA \n\nNÚMERO DE CUENTA: \t$numerocuenta \nSALDO ACTUAL: \t$saldo';
  }
}
