import 'package:comerciplus_flutter/screens/PostProveedor.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/Proveedor.dart';
import 'dart:convert';

class GetProveedores extends StatefulWidget {
  const GetProveedores({super.key});

  @override
  State<GetProveedores> createState() => _GetProveedoresState();
}

Future<List<Proveedor>> fetchProveedores() async {
  final response = await http.get(Uri.parse('http://localhost:5167/api/proveedores'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((proveedor) => Proveedor.fromJson(proveedor)).toList();
  } else {
    throw Exception('Falló en la carga de la API');
  }
}

class _GetProveedoresState extends State<GetProveedores> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Proveedores'),
      actions: <Widget>[
          ElevatedButton.icon(
                onPressed: () {
                  final route =
                  MaterialPageRoute(builder: (context) => const Registrar());
              Navigator.push(context, route);
                },
                icon: const Icon(Icons.add_circle_outline_sharp),
                label:(const Text('Agregar')),
              ),
        ],),
      
      body: 
      FutureBuilder<List<Proveedor>>(
        future: fetchProveedores(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Proveedores no encontrados'));
          } else {
            return LayoutBuilder(
              builder: (context, constraints) {
                final columnWidths = [150.0, 150.0, 150.0, 150.0, 150.0];
                double espacioWidget = constraints.maxWidth;
                List<int> columnasVisibles = [];
                List<int> columnasOcultas = [];

                double usedWidth = 0;
                for (int i = 0; i < columnWidths.length; i++) {
                  if (usedWidth + columnWidths[i] > espacioWidget) {
                    columnasOcultas.add(i);
                  } else {
                    columnasVisibles.add(i);
                    usedWidth += columnWidths[i];
                  }
                }

                return SingleChildScrollView(
                  
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: buildDataColumns(columnasVisibles, columnasOcultas),
                    rows: buildDataRows(snapshot.data!, columnasVisibles, columnasOcultas),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  List<DataColumn> buildDataColumns(List<int> visibleColumns, List<int> hiddenColumns) {
    List<DataColumn> columns = [];
    columns.addAll([
      if (visibleColumns.contains(0)) const DataColumn(label: Text('NIT')),
      const DataColumn(label: Text('Nombre')),
      if (visibleColumns.contains(2)) const DataColumn(label: Text('Teléfono')),
      if (visibleColumns.contains(3)) const DataColumn(label: Text('Dirección')),
      if (visibleColumns.contains(4)) const DataColumn(label: Text('Vendedor')),
    ]);
    if (hiddenColumns.isNotEmpty) {
      columns.add(const DataColumn(label: Text('')));
    }
    return columns;
  }

  List<DataRow> buildDataRows(List<Proveedor> proveedores, List<int> visibleColumns, List<int> hiddenColumns) {
    return proveedores.map((proveedor) {
      return DataRow(
        cells: [
          if (visibleColumns.contains(0)) DataCell(Text(proveedor.nit)),
          DataCell(Text(proveedor.nombreProveedor)),
          if (visibleColumns.contains(2)) DataCell(Text(proveedor.telefonoProveedor)),
          if (visibleColumns.contains(3)) DataCell(Text(proveedor.direccionProveedor)),
          if (visibleColumns.contains(4)) DataCell(Text(proveedor.nombreVendedor)),
          if (hiddenColumns.isNotEmpty)
            DataCell(
              ElevatedButton(
                onPressed: () {
                  detallesProveedor(context, proveedor, hiddenColumns);
                },
                child:(const Text('Ver más...')),
              ),
            ),
        ],
      );
    }).toList();
  }
}

void detallesProveedor(BuildContext context, Proveedor proveedor, List<int> hiddenColumns) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              if (hiddenColumns.contains(0)) Text('NIT: ${proveedor.nit}'),
              if (hiddenColumns.contains(2)) Text('Télefono: ${proveedor.telefonoProveedor}'),
              if (hiddenColumns.contains(3)) Text('Dirección: ${proveedor.direccionProveedor}'),
              if (hiddenColumns.contains(4)) Text('Vendedor: ${proveedor.nombreVendedor}'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cerrar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
