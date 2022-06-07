import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/widgets/wishlist_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12.withOpacity(0.1),
      appBar: AppBar(title: const Text('Sign up')),
      body: Column(
        children: [
          Center(
            child: CupertinoButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              color: Colors.amber,
              child: const Text('CLick here'),
            ),
          ),
          const WishlistWiidget(),
          const WishlistWiidget(isChecked: true),
        ],
      ),
    );
  }
}
