import 'package:crud_api/pages/lists.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // UserModel user = UserModel(
    //     firstName: "khush",
    //     lastName: 'Patel',
    //     email: 'pkhush256@gmail.com',
    //     sem: '5',
    //     id: 'aslkdjeoir');

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UsersList(),
    );
  }
}
