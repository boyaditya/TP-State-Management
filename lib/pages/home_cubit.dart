import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_state_management/cubit/employee_cubit.dart';
import 'package:tp_state_management/models/employee_model.dart';


class HomeScreenCubit extends StatefulWidget {
  const HomeScreenCubit({super.key});

  @override
  State<HomeScreenCubit> createState() => _HomeScreenStateCubit();
}

class _HomeScreenStateCubit extends State<HomeScreenCubit> {
  @override
  void initState() {
    super.initState();
    context.read<EmployeeCubit>().fetchEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen Cubit'),
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<EmployeeCubit, List<EmployeeModel>>(
                builder: (context, employees) {
                  return ListView.builder(
                    itemCount: employees.length,
                    itemBuilder: (context, index) {
                      final employee = employees[index];
                      print(employee.employeeName);
                      return ListTile(
                        title: Text(
                            "${employee.employeeName} (${employee.employeeAge})"),
                        subtitle: Text("Salary: ${employee.employeeSalary}"),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ));
  }
}
