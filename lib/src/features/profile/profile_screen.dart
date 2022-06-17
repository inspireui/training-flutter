import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import 'profile_viewmodel.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    context.read<ProfileViewModel>().loadDataUser(apiEndpoint);
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Consumer<ProfileViewModel>(
        builder: (context, viewmodel, child) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const Text('name:'),
              if (viewmodel.userName.isNotEmpty) ...[
                Text(jsonDecode(viewmodel.userName)['results'][0]['gender'] ??
                    'null'),
                Text(jsonDecode(viewmodel.userName)['results'][0]['name']
                        ['last'] ??
                    'null'),
              ] else
                const CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}
