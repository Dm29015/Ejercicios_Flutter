import 'package:flutter/material.dart';
import '../Controller/ExportController.dart';


class Export extends StatefulWidget {
  final Export? export;

  const Export({super.key, this.export});

  @override
  _ExportState createState() => _ExportState();
}

class _ExportState extends State<Export> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nombreProductoController =
      TextEditingController();
  late final TextEditingController _kgController = TextEditingController();
  late final TextEditingController _precioDollarController =
      TextEditingController();
  late DateTime _fechaRegistro = TextEditingController() as DateTime;

  @override
  void initState() {
    super.initState();
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
      title: Text(widget.export == null ? 'Add Export' : 'Edit Export'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              _buildTextField(_nombreProductoController, 'Nombre Producto',
                  'Please enter the product name'),
              _buildTextField(
                  _kgController, 'Kg', 'Please enter the weight in kg',
                  keyboardType: TextInputType.number),
              _buildTextField(_precioDollarController, 'Precio Dollar',
                  'Please enter the price in dollars',
                  keyboardType: TextInputType.number),
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
          child: Text(widget.export == null ? 'Add' : 'Save'),
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              var export = {
                "nombreProducto": _nombreProductoController.text,
                "kg": _kgController.text,
                "precioDollar": _precioDollarController.text,
                "fechaRegistro": _fechaRegistro
              };
              try {
                await createExport(export);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Exportación creada con éxito'),
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.green));
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Exportación denegada'),
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.red));
                throw Exception('Error al crear export');
                
              }
              // Navigator.of(context).pop(export);
            }
          },
        ),
      ],
    );
  }

  TextFormField _buildTextField(
      TextEditingController controller, String label, String validationMessage,
      {TextInputType keyboardType = TextInputType.text}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      keyboardType: keyboardType,
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
