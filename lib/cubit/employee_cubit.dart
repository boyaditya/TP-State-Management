import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tp_state_management/models/employee_model.dart';

class EmployeeCubit extends Cubit<List<EmployeeModel>> {
  EmployeeCubit() : super([]);

  void setFromJson(List<dynamic> json) {
    List<EmployeeModel> employees =
        json.map((item) => EmployeeModel.fromJson(item)).toList();
    emit(employees);
  }

  void fetchEmployees() async {
    final response = await http
        .get(Uri.parse('http://dummy.restapiexample.com/api/v1/employees'));
    // print(response.body);
    final data = jsonDecode(response.body)["data"];
    setFromJson(data);
  }

}
