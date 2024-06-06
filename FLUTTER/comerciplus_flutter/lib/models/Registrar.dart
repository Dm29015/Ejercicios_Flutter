import 'package:http/http.dart' as http;
import 'dart:convert';

class Http{
  static String API = "http://localhost:5167/api/proveedores";
  static postProveedor(Map proveedor) async{
    try {
      final res = await http.post(Uri.parse(API),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(proveedor),
     
      );
      if(res.statusCode == 200){//Si la respuesta es 200 la inserción es exitosa
        var data = jsonDecode(res.body.toString());
        print(data);
      }
      else{
        print(res.statusCode);
      }
    } catch(e){
     print(e.toString());
    }
  }
}