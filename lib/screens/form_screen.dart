import 'package:flutter/material.dart';
import 'package:humanresources/components/employee.dart';
import 'package:humanresources/data/employee_dao.dart';

class FormScreen extends StatefulWidget {

  const FormScreen({Key? key, required this.employeeContext}) : super(key: key);

  final BuildContext employeeContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController professionController = TextEditingController();
  TextEditingController registerController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Adicionar Nova Registro de Funcionário'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 580,
              width: 375,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(width: 3),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (valueValidator(value)) {
                          return 'Insira o nome do funcionário';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      controller: nameController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Nome do funcionário',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (valueValidator(value)) {
                          return 'Digite a profissão do novo funcionário';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: professionController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Profissão',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: (text) {
                        setState(() {});
                      },
                      validator: (value) {
                        if (valueValidator(value)) {
                          return 'Insira o número de registro do funcionário';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: registerController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Número de registro',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // print(nameController.text);
                        // print(priceController.text);
                        // print(imageController.text);
                        EmployeeDao().save(Employee(
                            nameController.text,
                            professionController.text,
                            registerController.text));
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                              content:
                              Text('Novo Cadastro de Funcionário Adicionado.'),
                        ));
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Adicionar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}