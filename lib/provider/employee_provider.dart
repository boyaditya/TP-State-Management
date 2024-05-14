import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tp_state_management/models/employee_model.dart';


class EmployeeProvider extends ChangeNotifier {
  List<EmployeeModel> _employees = [];

  List<EmployeeModel> get employees => _employees;

  void setFromJson(List<dynamic> json) {
    _employees = json.map((item) => EmployeeModel.fromJson(item)).toList();
    notifyListeners();
  }

  void fetchEmployees() async {
    final response = await http
        .get(Uri.parse('http://127.0.0.1:8000/employees'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)["data"];
      setFromJson(data);
    } else {
      throw Exception("Failed to load employees");
    }
  }
}
