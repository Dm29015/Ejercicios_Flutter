
class Export {
  final String id;
  final String nombreProducto;
  final double kg;
  final double precioDollar;
  final DateTime fechaRegistro;

  Export({
    required this.id,
    required this.nombreProducto,
    required this.kg,
    required this.precioDollar,
    required this.fechaRegistro,
  });

  factory Export.fromJson(Map<String, dynamic> json) {
    return Export(
      id: json['idExport'],
      nombreProducto: json['name'],
      kg: json['Kg'],
      precioDollar: json['PriceDollar'],
      fechaRegistro: json['RegistrationDate'],
    );
  }
}
