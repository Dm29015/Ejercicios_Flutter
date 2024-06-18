class Delito {
  final String departamento;
  final String municipio;
  final String codigoDane;
  final String armadiosMedios;
  final String fecha;
  final String genero;
  final String grupoEtario;
  final String tipohurto;
  final String cantidad;
  

Delito({required this.departamento, required this.municipio, required this.codigoDane, required this.armadiosMedios, required this.fecha, required this.genero, required this.grupoEtario, required this.tipohurto, required this.cantidad});


  factory Delito.fromJson(Map<String, dynamic> json) {
    return Delito(
      departamento: json['departamento']?? '',
      municipio: json['municipio']?? '',
      codigoDane: json['codigo_dane'],
      armadiosMedios: json['armas_medios']?? '',
      fecha: json['fecha_hecho']?? '',
      genero: json['genero']?? '',
      grupoEtario: json['grupo_etario']?? '',
      tipohurto: json['tipo_de_hurto']?? '',
      cantidad: json['cantidad']?? '',
    );
  }
 }