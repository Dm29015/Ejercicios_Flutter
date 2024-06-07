import 'package:flutter/material.dart';

import '../../controllers/ProveedorController.dart';
import '../../models/Proveedor.dart';

class Detallesproveedor extends StatefulWidget {
  final int id;

  const Detallesproveedor({super.key, required this.id});

  @override
  State<Detallesproveedor> createState() => _DetallesproveedorState();
}

class _DetallesproveedorState extends State<Detallesproveedor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 42, 54, 68),
      appBar: AppBar(backgroundColor:const Color.fromARGB(255, 42, 54, 68) ,),
      body: FutureBuilder<Proveedor>(
        future: fetchProveedor(widget.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('Proveedor no encontrado'));
          } else {
            var proveedor = snapshot.data!;
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CardW(proveedor: proveedor.nombreProveedor),
                      const SizedBox(height: 20.0),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: const Color.fromRGBO(111, 119, 133, 0.192),
                          border: Border.all(
                            color: const Color.fromARGB(43, 155, 39, 176),
                          ),
                        ),
                        child: Column(
                          children: [
                            CardInfo(
                              dato: proveedor.nit,
                              icono: Icons.calendar_month_outlined,
                              colorIcono:
                                  const Color.fromARGB(188, 255, 7, 201),
                            ),
                            CardInfo(
                              dato: proveedor.nombreVendedor,
                              icono: Icons.email_outlined,
                              colorIcono: Colors.blue,
                            ),
                            CardInfo(
                              dato: proveedor.telefonoProveedor,
                              icono: Icons.phone_android_rounded,
                              colorIcono: Colors.green,
                            ),
                            CardInfo(
                              dato: proveedor.direccionProveedor,
                              icono: Icons.location_on_outlined,
                              colorIcono: Colors.white,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

class CardW extends StatelessWidget {
  final String proveedor;

  const CardW({super.key, required this.proveedor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          const SizedBox(width: 20.0),
          Expanded(
              child: Text(proveedor,
                  style: const TextStyle(color: Colors.white, fontSize: 30))),
        ],
      ),
    );
  }
}

class CardInfo extends StatelessWidget {
  final String dato;
  final IconData icono;
  final Color colorIcono;

  const CardInfo(
      {super.key,
      required this.dato,
      required this.icono,
      required this.colorIcono});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          const SizedBox(width: 20.0),
          Icon(icono, color: colorIcono),
          //Icon(Icons.phone_android_rounded, color: Colors.green),
          const SizedBox(width: 10.0),
          Flexible(
            child: Text(
              dato,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}







// Container(
//                   padding: const EdgeInsets.all(20.0),
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20.0),
//                     color:  const Color.fromRGBO(111, 119, 133, 0.192),
//                     border: Border.all(
//                       color: const Color.fromARGB(43, 155, 39, 176),
//                     ),
//                   ),
//                   child: 
                
//                   child: const Column(
//                     children: [
//                       CardInfo(
//                           dato: '29/01/2005',
//                           icono: Icons.calendar_month_outlined,
//                           colorIcono: Color.fromARGB(188, 255, 7, 201)),
//                       CardInfo(
//                           dato: 'deisyco2901@gmail.com',
//                           icono: Icons.email_outlined,
//                           colorIcono: Colors.blue),
//                       CardInfo(
//                           dato: '3222500587',
//                           icono: Icons.phone_android_rounded,
//                           colorIcono: Colors.green),
//                       CardInfo(
//                           dato: 'Medellín, Colombia',
//                           icono: Icons.location_on_outlined,
//                           colorIcono: Colors.white)
//                     ],
//                   ),
//                 ),
              