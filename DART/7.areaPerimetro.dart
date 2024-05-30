// ÁREA Y PERÍMETRO DE UN CÍRCULO
import 'dart:math';

void main() {
  circulo Circulo = new circulo(3);

  (Circulo.validacion());
}

class circulo {
  double radio = 0.0;

  circulo(this.radio);

  void validacion() {
    if (radio > 0) {
      print("\n El área del círculo es de: ${Area().toStringAsFixed(2)}");
      print(
          "\n El perímetro del círculo es de: ${Perimetro().toStringAsFixed(2)}\n");
    } else {
      print("El radio no puede ser inferior a 0");
    }
  }

  double Area() {
    double area = pi * pow(radio, 2);

    return area;
  }

  double Perimetro() {
    double perimetro = 2 * pi * radio;

    return perimetro;
  }
}
