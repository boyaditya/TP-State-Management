import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp_state_management/provider/employee_provider.dart';

class HomeScreenProvider extends StatefulWidget {
  const HomeScreenProvider({super.key});

  @override
  State<HomeScreenProvider> createState() => _HomeScreenStateProvider();
}

class _HomeScreenStateProvider extends State<HomeScreenProvider> {
  @override
  void initState() {
    super.initState();
    Provider.of<EmployeeProvider>(context, listen: false).fetchEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen Provider'),
      ),
      body: Consumer<EmployeeProvider>(
        builder: (context, employeeProvider, child) {
          return ListView.builder(
            itemCount: employeeProvider.employees.length,
            itemBuilder: (context, index) {
              final employee = employeeProvider.employees[index];
              return ListTile(
                title:
                    Text("${employee.employeeName} (${employee.employeeAge})"),
                subtitle: Text("Salary: ${employee.employeeSalary}"),
              );
            },
          );
        },
      ),
    );
  }
}
