import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int? _type = 1;
  bool _isChecked1 = true;
  bool _isChecked2 = false;

  String _dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CMRU Coffee Cafe"),
        backgroundColor: Colors.brown[900],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Radio<int>(
                      value: 1,
                      groupValue: _type,
                      onChanged: (value) {
                        setState(() {
                          _type = value;
                        });
                      }),
                  Text('เอสเพรสโซ (Espresso)'),
                  SizedBox(
                    width: 20,
                  ),
                  Radio<int>(
                      value: 2,
                      groupValue: _type,
                      onChanged: (value) {
                        setState(() {
                          _type = value;
                        });
                      }),
                  Text("อเมริกาโน (Americano)"),
                  SizedBox(
                    width: 20,
                  ),
                  Radio<int>(
                      value: 3,
                      groupValue: _type,
                      onChanged: (value) {
                        setState(() {
                          _type = value;
                        });
                      }),
                  Text("มอคค่า (Mocca)"),
                  SizedBox(
                    width: 20,
                  ),
                  Radio<int>(
                      value: 4,
                      groupValue: _type,
                      onChanged: (value) {
                        setState(() {
                          _type = value;
                        });
                      }),
                  Text("ลาเต้ (Latte)"),
                  Radio<int>(
                      value: 5,
                      groupValue: _type,
                      onChanged: (value) {
                        setState(() {
                          _type = value;
                        });
                      }),
                  Text("คาปูชิโน (Cappuccino)"),
                ],
              ),
            ),
            ListTile(
              leading: Checkbox(
                  value: _isChecked1, // bool _isChecked1 = true;
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked1 = value!;
                    });
                  }),
              title: Text("Yes"),
              subtitle: Text('ใส่น้ำตาล'),
            ),
            ListTile(
              leading: Checkbox(
                  value: _isChecked2, // bool _isChecked2 = false;
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked2 = value!;
                    });
                  }),
              title: Text("No Sugar"),
              subtitle: Text("ไม่ใส่น้ำตาล"),
            ),
            DropdownButton<String>(
              value: _dropdownValue, // String _dropdownValue = 'One';
              onChanged: (String? newValue) {
                setState(() {
                  _dropdownValue = newValue!;
                });
              },
              items: <String>['One', 'Two', 'Free', 'Four']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              content: Column(
                            children: [
                              Text(nameController.text),
                              Text("ประเภท = $_type"),
                              Text("น้ำตาล = $_isChecked1"),
                              Text("จำนวน = $_dropdownValue")
                            ],
                          ));
                        },
                      );
                    }
                  },
                  child: Text("กดสั่ง")),
            )
          ],
        ),
      ),
    );
  }
}
