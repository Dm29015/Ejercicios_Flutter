import 'dart:io';
import 'dart:math';

void main() {
  List<Aprendices> aprendices = [];
  List<Ventas> ventas = [];

  bool bandera = true;

  while (bandera) {
    print("\n\t MENÚ " +
        "\n1 Registrar inasistencia\r" +
        "\n2.Listar todas las Inasistencias\r" +
        "\n3.Listar los aprendices con inasistencias superiores a 3\r" +
        "\n4.Consultar el total de inasistencias por aprendiz.\r" +
        "\n5.Valor a Pagar\r" +
        "\n6.Listar ventas\r" +
        "\n7.Número de suerte\r" +
        "\n8. Salir\r\n");

    int opcion = int.parse(stdin.readLineSync()!);

    switch (opcion) {
      case 1:
        Aprendices.RegistrarAprendices(aprendices);
        break;

      case 2:
        Aprendices.ListarAprendices(aprendices);
        break;

      case 3:
        Aprendices.Inasistencias3(aprendices);
        break;

      case 4:
        Aprendices.inasistenciaAprendiz(aprendices);
        break;

      case 5:
        print(Ventas.RegistrarVenta(ventas));
        break;

      case 6:
        Ventas.ListarVentas(ventas);
        break;

      case 7:
      print(NumeroDeSuerte());
        break;

      case 8:
        bandera = false;
        break;

      default:
        print("Opción no válida");

        break;
    }
  }
}

class Aprendices {
  int Documento;
  String? NombreCompleto;
  int Inasistencias;

  Aprendices(this.Documento, this.NombreCompleto, this.Inasistencias);

  static void RegistrarAprendices(List<Aprendices> aprendices) {
    stdout.write("Ingrese el documento: ");
    int Documento = int.parse(stdin.readLineSync()!);

    stdout.write("Ingrese el nombre: ");
    String? NombreCompleto = stdin.readLineSync();

    stdout.write("Ingrese las inasistencias: ");
    int Inasistencias = int.parse(stdin.readLineSync()!);

    Aprendices aprendiz = Aprendices(Documento, NombreCompleto, Inasistencias);

    bool encontrado = false;

    if (Inasistencias < 1 || Inasistencias > 100) {
      print("Las inasistencias solo se registran en un rango de 1 a 100");
    } else {
      for (var a in aprendices) {
        if (a.Documento == aprendiz.Documento) {
          a.Inasistencias += Inasistencias;
          encontrado = true;
          break;
        }
      }
      if (!encontrado) {
        aprendices.add(aprendiz);
      }
    }
  }

  static void ListarAprendices(List<Aprendices> aprendices) {
    if (aprendices.isEmpty) {
      print("\n\bNo hay aprendices registrados.");
    } else {
      print(
          "\n\tAprendices registrados \n---------------------------------------------");

      for (var a in aprendices) {
        print(a);
      }
    }
  }

  static void Inasistencias3(List<Aprendices> aprendices) {
    print("\nAprendices con inasistencias superiores a 3:");
    for (var a in aprendices) {
      if (a.Inasistencias > 3) {
        print(a);
      }
    }
  }

  static void inasistenciaAprendiz(List<Aprendices> aprendices) {
    stdout.write("\nIngrese el documento del estudiante: ");
    int Documento = int.parse(stdin.readLineSync()!);

    bool encontrado = false;
    for (var a in aprendices) {
      if (a.Documento == Documento) {
        print(a);
        encontrado = true;
      }
    }

    if (!encontrado) {
      print("\nNo se encontró ningún estudiante con ese documento.");
    }
  }

  @override
  String toString() {
    return "Documento: $Documento \nNombre Completo: $NombreCompleto \nInasistencias: $Inasistencias \n--------------------------------------------------------";
  }
}

class Ventas {
  String? codigo;
  String? nombre;
  double precio;
  int cantidad;

  Ventas(this.codigo, this.nombre, this.precio, this.cantidad);

  static double RegistrarVenta(List<Ventas> ventas) {
    stdout.write("Ingrese el código: ");
    String? codigo = stdin.readLineSync();

    stdout.write("Ingrese el nombre del producto: ");
    String? nombre = stdin.readLineSync();

    stdout.write("Ingrese el precio unitario: ");
    double precio = double.parse(stdin.readLineSync()!);

    stdout.write("Ingrese la cantidad: ");
    int cantidad = int.parse(stdin.readLineSync()!);

    if (precio <= 0 || cantidad <= 0) {
      print("Error: El precio y la cantidad deben ser mayores que 0.");
    }

    double valorBruto = precio * cantidad;

    double valorIVA = valorBruto * 0.19;

    double descuento;

    if(cantidad>10){
      descuento = valorBruto * 0.10;
      
    }else{
      descuento = 0;
    }
    print("\nValor Bruto: $valorBruto \nIVA: $valorIVA \nDescuento: $descuento");

    double valorPagar = (valorBruto + valorIVA) - descuento;

    Ventas venta = Ventas(codigo, nombre, precio, cantidad);

    ventas.add(venta);

    return valorPagar;
  }

  static void ListarVentas(List<Ventas> ventas) {
    if (ventas.isEmpty) {
      print("\n\bNo hay ventas registradas.");
    } else {
      print(
          "\n\tTotal ventas registrados \n---------------------------------------------");
      print("\nCÓDIGO \tPRODUCTO\tPRECIO U. \tCANTIDAD");
      for (var v in ventas) {
        print(v);
      }
    }
  }

  

@override
String toString() {
    
    return '\n$codigo \t$nombre \t\t$precio \t\t$cantidad ';
  }
}

String NumeroDeSuerte() {
  int numero = Random().nextInt(1000);

  String numeroFormateado = numero.toString().padLeft(3, '0');

  return numeroFormateado;
}