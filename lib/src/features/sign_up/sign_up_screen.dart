import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/widgets/wishlist_widget.dart';

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
    return Scaffold(
      backgroundColor: Colors.black12.withOpacity(0.1),
      appBar: AppBar(title: const Text('Sign up')),
      body: Column(
        children: [
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
            height: 400,
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
