import 'package:humanresources/components/employee.dart';
import 'package:humanresources/data/database.dart';
import 'package:sqflite/sqlite_api.dart';

class EmployeeDao {

  static String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_profession TEXT, '
      '$_register TEXT)';

  static String _tablename = 'EmployeeTable';
  static String _name = 'name';
  static String _profession = 'price';
  static String _register = 'image';

  save(Employee employeeoption) async {
    print('Iniciando o save: ');
    final Database bancoDeDados = await getDatabase();
    var itemExists = await find(employeeoption.nameoption);
    Map<String,dynamic> employeemap = toMap(employeeoption);
    if(itemExists.isEmpty){
      print('O registro de funcionário não Existia.');
      return await bancoDeDados.insert(_tablename, employeemap);
    } else {
      print('O registro de funcionário já existia!');
      return await bancoDeDados.update(
        _tablename,
        employeemap,
        where: '$_name = ?',
        whereArgs: [employeeoption.nameoption],
      );
    }
  }

  Map<String,dynamic> toMap(Employee employeeoption){
    print('Convertendo Opçao em Map: ');
    final Map<String,dynamic> mapaDeFuncionarios = Map();
    mapaDeFuncionarios[_name] = employeeoption.nameoption;
    mapaDeFuncionarios[_profession] = employeeoption.professionoption;
    mapaDeFuncionarios[_register] = employeeoption.registeroption;
    print('Mapa de Funcionários: $mapaDeFuncionarios');
    return mapaDeFuncionarios;
  }

  Future<List<Employee>> findAll() async {
    print('Acessando o findAll: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String,dynamic>> result = await bancoDeDados.query(_tablename);
    print('Procurando dados no banco de dados... Encontrado: $result');
    return toList(result);
  }

  List<Employee> toList(List<Map<String,dynamic>> mapaDeFuncionarios){
    print('Convertendo to List: ');
    final List<Employee> funcionarios = [];
    for (Map<String,dynamic> linha in mapaDeFuncionarios){
      final Employee opcao = Employee(linha[_name], linha[_profession], linha[_register]);
      funcionarios.add(opcao);
    }
    print('Lista de Registros $funcionarios');
    return funcionarios;
  }

  Future<List<Employee>> find(String NomeDoFuncionario) async {
    print('Acessando find: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
      _tablename, where: '$_name = ?', whereArgs: [NomeDoFuncionario],);
    print('Funcionário encontrado: ${toList(result)}');
    return toList(result);
  }

  delete(String NomeDoFuncionario) async {
    print('Deletando um registro: $NomeDoFuncionario');
    final Database bancoDeDados = await getDatabase();
    return bancoDeDados.delete(_tablename,  where: '$_name = ?', whereArgs: [NomeDoFuncionario],);
  }

}