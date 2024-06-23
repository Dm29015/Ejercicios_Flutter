class Export {
  final int id;
  final String nombreProducto;
  final String kg;
  final String precioDollar;
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
      kg: json['kg'],
      precioDollar: json['priceDollar'],
      fechaRegistro: DateTime.parse(json['registrationDate']),
    );
  }
}
