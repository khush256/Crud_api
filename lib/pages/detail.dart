import 'dart:async';
import 'dart:convert';

import 'package:crud_api/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Detail extends StatefulWidget {
  final UserModel? user;
  final bool? isAdd;
  const Detail({super.key, this.user, this.isAdd = false});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  Future<void> updateUser(UserModel user) async {
    try {
      final response = await http.put(
        Uri.parse(
            "https://ca0fd29202dc8eff0b3a.free.beeceptor.com/api/users/${widget.user!.id}"),
        body: jsonEncode({
          'first_name': user.firstName,
          'last_name': user.lastName,
          'email': user.email,
          'sem': user.sem
        }),
      );
      if (response.statusCode == 200) {
        Get.snackbar('Update', "Details updated successfully");
        if (mounted) {
          Navigator.pop(context);
        }
      } else {
        Get.snackbar('Error', "Error occured while updating details");
        if (mounted) {
          Navigator.pop(context);
        }
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
      if (mounted) {
        Navigator.pop(context);
      }
      (context);
    }
  }

  Future<void> deleteUser(String? id) async {
    try {
      final response = await http.delete(
        Uri.parse(
            "https://ca0fd29202dc8eff0b3a.free.beeceptor.com/api/users/${widget.user!.id}"),
      );

      if (response.statusCode == 200) {
        Get.snackbar('Delete', "Details deleted successfully");
        if (mounted) {
          Navigator.pop(context);
        }
      } else {
        Get.snackbar('Error', "Error occured while deleting details");
        if (mounted) {
          Navigator.pop(context);
        }
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
      if (mounted) {
        Navigator.pop(context);
      }
    }
  }

  Future<void> addUser(UserModel user) async {
    try {
      final response = await http.post(
        Uri.parse("https://ca0fd29202dc8eff0b3a.free.beeceptor.com/api/users/"),
        body: jsonEncode({
          'first_name': user.firstName,
          'last_name': user.lastName,
          'email': user.email,
          'sem': user.sem
        }),
      );
      if (response.statusCode == 200) {
        Get.snackbar('Add', "User added successfully");
        if (mounted) {
          Navigator.pop(context);
        }
      } else {
        Get.snackbar('Error', "Error occured while adding user");
        if (mounted) {
          Navigator.pop(context);
        }
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
      if (mounted) {
        Navigator.pop(context);
      }
      
    }
  }

  final TextEditingController _fname = TextEditingController();
  final TextEditingController _lname = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _sem = TextEditingController();
  final TextEditingController _id = TextEditingController();

  @override
  void initState() {
    if (widget.user != null) {
      _fname.text = widget.user!.firstName!;
      _lname.text = widget.user!.lastName!;
      _email.text = widget.user!.email!;
      _sem.text = widget.user!.sem!;
      _id.text = widget.user!.id!;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text('Details of User'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'First Name',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10.0),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: TextField(
                    controller: _fname,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'Last Name',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10.0),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: TextField(
                    controller: _lname,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'Email',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10.0),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: TextField(
                    controller: _email,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Sem',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10.0),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: TextField(
                    controller: _sem,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const Text(
                  'Id',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10.0),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: TextField(
                    readOnly: true,
                    controller: _id,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget.isAdd!
                        ? Container()
                        : ElevatedButton(
                            onPressed: () async {
                              UserModel user = UserModel(
                                firstName: _fname.text,
                                lastName: _lname.text,
                                email: _email.text,
                                sem: _sem.text,
                              );
                              await updateUser(user);
                            },
                            child: const Text('Update')),
                    const SizedBox(
                      width: 20,
                    ),
                    widget.isAdd!
                        ? Container()
                        : ElevatedButton(
                            onPressed: () async {
                              await deleteUser(widget.user!.id);
                            },
                            child: const Text('Delete')),
                    const SizedBox(
                      width: 20,
                    ),
                    widget.isAdd!
                        ? ElevatedButton(
                            onPressed: () async {
                              UserModel user = UserModel(
                                firstName: _fname.text,
                                lastName: _lname.text,
                                email: _email.text,
                                sem: _sem.text,
                              );
                              await addUser(user);
                            },
                            child: const Text('Add'))
                        : Container(),
                  ],
                )),
              ],
            ),
          ),
        ));
  }
}
