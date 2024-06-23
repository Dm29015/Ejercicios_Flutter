import 'package:flutter/material.dart';
import '../Controller/ExportController.dart';
import '../Models/Export.dart';

class EditExport extends StatefulWidget {
  final Export export;

  const EditExport({super.key, required this.export});

  @override
  _EditExportState createState() => _EditExportState();
}

class _EditExportState extends State<EditExport> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nombreProductoController;
  late final TextEditingController _kgController;
  late final TextEditingController _precioDollarController;
  late DateTime _fechaRegistro;

  @override
  void initState() {
    super.initState();
    _nombreProductoController =
        TextEditingController(text: widget.export.nombreProducto);
    _kgController = TextEditingController(text: widget.export.kg.toString());
    _precioDollarController =
        TextEditingController(text: widget.export.precioDollar.toString());
    _fechaRegistro = widget.export.fechaRegistro;
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
      title: const Text('Edit Export'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              _buildTextField(_nombreProductoController, 'Nombre Producto',
                  'Por favor ingrese el nombre del producto'),
              _buildTextField(_kgController, 'Kg',
                  'Por favor ingrese el peso en kilogramos',
                  keyboardType: TextInputType.number),
              _buildTextField(
                  _precioDollarController, 'Precio Dollar', 'Precio del dólar',
                  keyboardType: TextInputType.number, readOnly: true),
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
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Save'),
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              var export = {
                "idExport": widget.export.id,
                "name": _nombreProductoController.text,
                "kg": _kgController.text,
                "priceDollar": _precioDollarController.text,
                "registrationDate": _fechaRegistro.toIso8601String(),
              };

              try {
                await updateExport(widget.export.id, export);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Exportación actualizada con éxito'),
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.green,
                  ),
                );
                Navigator.of(context)
                    .pop(true); // Indica éxito al cerrar el diálogo
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Error al actualizar exportación: $e'),
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

  TextFormField _buildTextField(
      TextEditingController controller, String label, String validationMessage,
      {TextInputType keyboardType = TextInputType.text,
      bool readOnly = false}) {
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
