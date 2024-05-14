// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// // ignore_for_file: non_constant_identifier_names

// class EmployeeModel extends ChangeNotifier {
//   String employee_name;
//   int employee_salary;
//   int employee_age;
//   String profile_image;

//   EmployeeModel({
//     required this.employee_name,
//     required this.employee_salary,
//     required this.employee_age,
//     required this.profile_image,
//   });

//   factory EmployeeModel.fromJson(Map<String, dynamic> json) {
//     return EmployeeModel(
//       employee_name: json['employee_name'],
//       employee_salary: json['employee_salary'],
//       employee_age: json['employee_age'],
//       profile_image: json['profile_image'],
//     );
//   }

//   void setFromJson(Map<String, dynamic> json) {
//     employee_name = json['employee_name'];
//     employee_salary = json['employee_salary'];
//     employee_age = json['employee_age'];
//     profile_image = json['profile_image'];
//     notifyListeners();
//   }

//   void fetchEmployees() async {
//     // API call to get employees
//     const url = "https://dummy.restapiexample.com/api/v1/employees";
//     final uri = Uri.parse(url);
//     final response = await http.get(uri);
//     if (response.statusCode == 200) {
//       setFromJson(jsonDecode(response.body)["data"]);
//     } else {
//       throw Exception("Failed to load employees");
//     }
//   }
// }


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
        .get(Uri.parse('http://dummy.restapiexample.com/api/v1/employees'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)["data"];
      setFromJson(data);
    } else {
      throw Exception("Failed to load employees");
    }
  }
}
