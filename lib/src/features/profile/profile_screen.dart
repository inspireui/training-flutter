import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const apiEndpoint = 'https://randomuser.me/api/';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var userName = '';

  Future<String> _getDataUser(String url) async {
    final uri = Uri.parse(url);

    final response = await http.get(uri);
    await Future.delayed(const Duration(seconds: 3));
    return response.body;
  }

  @override
  void initState() {
    _getDataUser(apiEndpoint).then((value) {
      setState(() {
        userName = value;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const Text('name:'),
            if (userName.isNotEmpty) ...[
              Text(jsonDecode(userName)['results'][0]['gender'] ?? 'null'),
              Text(
                  jsonDecode(userName)['results'][0]['name']['last'] ?? 'null'),
            ] else
              const  CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
