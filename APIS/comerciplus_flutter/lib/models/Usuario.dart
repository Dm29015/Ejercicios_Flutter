 class Usuario {
  final int id;
  final String nombreCompleto;
  final String correo;
  final String clave;
  final String telefono;

  Usuario({required this.id, required this.nombreCompleto, required this.correo, required this.clave, required this.telefono });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'],
      nombreCompleto: json['nombreCompleto'],
      correo: json['correo'],
      clave: json['clave'],
      telefono: json['telefono']
    );
  }
 }


 
