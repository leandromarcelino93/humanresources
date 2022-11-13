import 'package:flutter/material.dart';
import 'package:humanresources/components/employee.dart';
import 'package:humanresources/data/employee_dao.dart';
import 'form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Cadastro de Funcionários'),
        actions: [IconButton(onPressed: (){setState(() {});}, icon: Icon(Icons.refresh))],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 8, bottom: 70),
        child: FutureBuilder<List<Employee>>(future: EmployeeDao().findAll(), builder: (context, snapshot){
          List<Employee>? items = snapshot.data;
          switch (snapshot.connectionState){
            case ConnectionState.none:
              return Center(child: Column(children: [CircularProgressIndicator(), Text('Carregando')],),);
              break;
            case ConnectionState.waiting:
              return Center(child: Column(children: [CircularProgressIndicator(), Text('Carregando')],),);
              break;
            case ConnectionState.active:
              return Center(child: Column(children: [CircularProgressIndicator(), Text('Carregando')],),);
              break;
            case ConnectionState.done:
              if (snapshot.hasData && items != null) {
                if (items.isNotEmpty) {
                  return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Employee option = items[index];
                        return option;
                      });
                }
                return Center(
                  child: Column(
                    children: [
                      Icon(Icons.error_outline, size: 128),
                      Text('Não há nenhum registro de funcionário',
                          style: TextStyle(fontSize: 32))
                    ],
                  ),
                );
              }
              return Text('Erro ao carregar os registros de Funcionários');
              break;
          }
          return Text('Erro desconhecido');
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (contextNew) => FormScreen(
                    employeeContext: context,
                  ))).then((value) => setState((){print('Estamos rebuildando a tela!');}));

        },
        child: const Icon(Icons.add),
      ),
    );
  }
}