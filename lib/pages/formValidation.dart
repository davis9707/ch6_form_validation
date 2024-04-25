import 'package:flutter/material.dart';

class FormValidationTest extends StatefulWidget {
  const FormValidationTest({super.key});

  @override
  State<FormValidationTest> createState() => _FormValidationTestState();
}

class _FormValidationTestState extends State<FormValidationTest> {
  void _submitOrder() {}
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  Order _order = Order();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Form Validation',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: <Widget>[
          Form(
            key: _formStateKey,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Espresso',
                      labelText: 'Item',
                    ),
                    validator: ((value) => _validateItemRequired(value!)),
                    onSaved: (value) => _order.item = value!,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: '3',
                      labelText: 'Quantity',
                    ),
                    validator: (value) => _validationCount(value!),
                    onSaved: (value) => _order.quantity = int.tryParse(value!)!,
                  ),
                  Divider(),
                  ElevatedButton(
                    onPressed: _submitOrder,
                    child: Text('save'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String? _validateItemRequired(String value) {
  print(value);
  return value.isEmpty ? 'Item Required' : null;
}

String? _validationCount(String value) {
  int? _valueAsInteger = value.isEmpty ? 0 : int.tryParse(value);
  return _valueAsInteger == 0 ? 'At least one item item is required' : null;
}

class Order {
  late String item;
  late int quantity;
}
