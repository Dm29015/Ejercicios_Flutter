import 'package:flutter/material.dart';
import '../Controller/ExportController.dart';

class RegisterExport extends StatefulWidget {
  const RegisterExport({super.key});

  @override
  _RegisterExportState createState() => _RegisterExportState();
}

class _RegisterExportState extends State<RegisterExport> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreProductoController = TextEditingController();
  final TextEditingController _kgController = TextEditingController();
  final TextEditingController _precioDollarController = TextEditingController();
  DateTime _fechaRegistro = DateTime.now();

  @override
  void initState() {
    super.initState();
    _fetchDolarValue();
  }

  Future<void> _fetchDolarValue() async {
    try {
      double valor = await valorDolar();
      setState(() {
        _precioDollarController.text = valor.toString();
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al obtener el valor del dólar: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _selectDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _fechaRegistro,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _fechaRegistro) {
      setState(() {
        _fechaRegistro = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Registrar exportación'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              _buildTextField(_nombreProductoController, 'Nombre Producto', 'Por favor ingrese el nombre del producto'),
              _buildTextField(_kgController, 'Kg', 'Por favor ingrese el peso en kilogramos', keyboardType: TextInputType.number),
              _buildTextField(_precioDollarController, 'Precio Dollar', 'Precio del dólar', keyboardType: TextInputType.number, readOnly: true),
              ListTile(
                title: Text('Fecha Registro: ${_fechaRegistro.toLocal()}'),
                trailing: const Icon(Icons.calendar_today),
                onTap: _selectDate,
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancelar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Guardar'),
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              var export = {
                "name": _nombreProductoController.text,
                "kg": _kgController.text,
                "priceDollar": _precioDollarController.text,
                "registrationDate": _fechaRegistro.toIso8601String(),
              };
              try {
                await createExport(export);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Exportación creada con éxito'),
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.green,
                  ),
                );
                Navigator.of(context).pop();
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Error al crear exportación: $e'),
                    duration: const Duration(seconds: 2),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            }
          },
        ),
      ],
    );
  }

  TextFormField _buildTextField(TextEditingController controller, String label, String validationMessage, {TextInputType keyboardType = TextInputType.text, bool readOnly = false}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      keyboardType: keyboardType,
      readOnly: readOnly,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validationMessage;
        }
        return null;
      },
    );
  }

  @override
  void dispose() {
    _nombreProductoController.dispose();
    _kgController.dispose();
    _precioDollarController.dispose();
    super.dispose();
  }
}
