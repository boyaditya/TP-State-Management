import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp_state_management/pages/home_provider.dart';
import 'package:tp_state_management/provider/employee_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => EmployeeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreenProvider(),
    );
  }
}
