import 'package:flutter/material.dart';
import 'package:humanresources/data/employee_dao.dart';

class Employee extends StatefulWidget {

  final String nameoption;
  final String professionoption;
  final String registeroption;

  const Employee(this.nameoption, this.professionoption, this.registeroption,
      {Key? key})
      : super(key: key);

  @override
  State<Employee> createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.white),
        height: 150,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ElevatedButton(
                    onLongPress: () {
                      EmployeeDao().delete(widget.nameoption);
                    },
                    onPressed: () {},
                    child: const Icon(Icons.remove),
                  ),
                  Row(
                    children: [
                       Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                  child: Text(widget.nameoption,
                                      style: TextStyle(
                                        fontSize: 21,
                                      )),
                                  width: 250,
                                  height: 30,
                                  color: Colors.white),
                              Container(
                                  child: Text(widget.professionoption,
                                      style: TextStyle(
                                        fontSize: 21,
                                      )),
                                  width: 250,
                                  height: 30,
                                  color: Colors.white),
                              Container(
                                  child: Text(widget.registeroption,
                                      style: TextStyle(
                                        fontSize: 21,
                                      )),
                                  width: 250,
                                  height: 30,
                                  color: Colors.white),
                            ],
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

