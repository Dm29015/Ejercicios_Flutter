// TIENDA – INVENTARIO

import 'dart:io';

void main() {
  Productos producto = new Productos("arroz", 5, 5000, 7000);

  print("\n $producto");

  producto.menu();
}

class Productos {
  String nombreProducto;

  int stock;

  double precioCompra;

  double precioVenta;

  Productos(
      this.nombreProducto, this.stock, this.precioCompra, this.precioVenta);

  void menu() {
    bool b = true;

    while (b) {
      print(
          "\n\tMENÚ \n¿Qué deseas hacer? \n1. Realizar una venta \n2. Registrar una compra \n3. Salir");

      int opcion = int.parse(stdin.readLineSync()!);

      print("\nIngrese la cantidad");

      int cantidad = int.parse(stdin.readLineSync()!);

      if (cantidad < 0) {
        print("\nLa cantidad no puede ser inferior a 0");
      } else {
        switch (opcion) {
          case 1:
            venta(cantidad);
            print(toString());
            break;

          case 2:
            compra(cantidad);
            print(toString());
            break;

          case 3:
            b = false;
            break;

          default:
            print("Opción inválida.");
            break;
        }
      }
    }
  }

  int venta(int cantidad) {
    if (cantidad > stock || stock == 5) {
      print("\nNO SE PUEDE REALIZAR LA VENTA");

      return 0;
    } else {
      stock -= cantidad;

      return stock;
    }
  }

  int compra(int cantidad) {
    stock += cantidad;

    return stock;
  }

  @override
  String toString() {
    return "\nPRODUCTO    STOCK \tPRECIOCOMPRA \tPRECIOVENTA \n $nombreProducto\t\t$stock \t$precioCompra \t\t$precioVenta";
  }
}
