// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CardCliente extends StatelessWidget {
  final String nombreCliente,apellidoCliente, telefonoCliente;
  final Color colorIcon;

  const CardCliente({
    super.key,
    required this.colorIcon,
    required this.nombreCliente,
    required this.apellidoCliente,
    required this.telefonoCliente
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(111, 119, 133, 0.192),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: colorIcon,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: const Icon(Icons.business, color: Color.fromARGB(255, 42, 54, 68)),
          ),
          const SizedBox(width: 20.0),
    
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nombreCliente + apellidoCliente,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  maxLines: 2, // Limita el número máximo de líneas a 2
                  overflow: TextOverflow.ellipsis, // Muestra puntos suspensivos si el texto se desborda
                ),
                const SizedBox(height: 7.0),
                Text(
                  telefonoCliente,
                  style: const TextStyle(color: Colors.grey, fontSize: 13)
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

