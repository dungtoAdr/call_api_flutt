import 'dart:convert';

import 'package:call_api_flut/model/user.dart';
import 'package:call_api_flut/model/user_name.dart';
import 'package:call_api_flut/services/user_api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rest API Call", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          final email = user.email;
          final color = user.gender == 'male' ? Colors.blue : Colors.green;
          return Column(
            children: [
              Card(
                margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(user.fullName),
                      subtitle: Text(user.name.last),

                    ),
                    ListTile(
                      title: Text(user.phone),
                      subtitle: Text(user.gender),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void fetchUsers() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }
}
