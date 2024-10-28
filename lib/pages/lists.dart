import 'dart:convert';

import 'package:crud_api/models/user_model.dart';
import 'package:crud_api/pages/detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  List<UserModel> userList = [];

  Future<List<UserModel>> getUsersList() async {
    try {
      final response = await http.get(Uri.parse(
          "https://ca47c859003ad6c66eff.free.beeceptor.com/api/users"));
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        userList.clear();
        for (Map user in data) {
          userList.add(UserModel.fromJson(user));
        }
        return userList;
      }
      return userList;
    } catch (e) {
      Get.snackbar('Error', e.toString());
      return userList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Lists of users'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () async {
          // final result = await Get.to(() => const Detail(
          //       isAdd: true,
          //     ));
          // if (result == true) {
          //   setState(() {});
          // }
          Get.to(() => const Detail(isAdd: true))?.then((value) {
            if (value == true) {
              setState(() {});
            }
          });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
          return await Future.delayed(const Duration(milliseconds: 500));
        },
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getUsersList(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: userList.length,
                        itemBuilder: (context, index) {
                          var data = snapshot.data!;
                          return GestureDetector(
                            onTap: () async {
                              // final result = await Get.to(
                              //     () => Detail(user: userList[index]));
                              // if (result == true) {
                              //   setState(() {}); // Refresh the list
                              // }
                              Get.to(() => Detail(user: userList[index]))
                                  ?.then((value) {
                                if (value == true) {
                                  setState(() {}); // Refresh the list
                                }
                              });
                            },
                            child: Card(
                              margin: const EdgeInsets.all(8.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "First Name: ${data[index].firstName}",
                                    ),
                                    Text(
                                      "Last Name: ${data[index].lastName}",
                                    ),
                                    Text(
                                      "Email: ${data[index].email}",
                                    ),
                                    Text(
                                      "Sem: ${data[index].sem}",
                                    ),
                                    Text(
                                      "Id: ${data[index].id}",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
