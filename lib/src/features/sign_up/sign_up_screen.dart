import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/widgets/wishlist_widget.dart';
import '../factory.dart';
import '../profile/profile_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int page = 0;
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    const dataStr = '''
{
  "name": "John Smith",
  "email": "john@example.com"
}
''';
    final user = User('teo', 'teo@gmail.com');

    return Scaffold(
      appBar: AppBar(title: const Text('Sign up')),
      body: Column(
        children: [
          Text(User.fromJson(jsonDecode(dataStr)).name),
          Text('email: ${User.fromJson(jsonDecode(dataStr)).email}'),
          Text(jsonEncode(user)),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          FeatureFactory.create<ProfileScreen>()),
                );
              },
              style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ))),
              child: const Text('Profile screen'),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30).copyWith(bottom: 20),
            child: InkWell(
              onDoubleTap: () {
                // ignore: avoid_print
                print('onDoubleTap');
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF101010),
                  borderRadius: BorderRadius.circular(100),
                ),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Get Started'.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
          OutlinedButton(onPressed: () {}, child: const Text('OutlinedButton')),
          Text(
            'headline3',
            style: Theme.of(context).textTheme.headline3,
          ),
          Text(
            'headline3',
            style: Theme.of(context).textTheme.headline3?.copyWith(
                  color: Colors.green,
                ),
          ),
          Center(
            child: CupertinoButton(
              onPressed: () {
                // Navigator.of(context).pop();
                if (page > 3) {
                  page = 0;
                } else {
                  page++;
                }
                _controller.jumpToPage(page);
              },
              color: Colors.amber,
              child: const Text('CLick here'),
            ),
          ),
          const WishlistWiidget(),
          const WishlistWiidget(isChecked: true),
          SizedBox(
            height: 200,
            child: PageView(
              controller: _controller,
              children: [
                Container(
                  color: Colors.amber,
                  child: const Text('text 1'),
                ),
                Container(
                  color: Colors.blue,
                  child: const Text('text 2'),
                ),
                Container(
                  color: Colors.amber,
                  child: const Text('text 3'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class User {
  final String name;
  final String email;

  User(this.name, this.email);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
      };
}
