import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppbarCustom extends StatefulWidget implements PreferredSizeWidget {
  const AppbarCustom({Key? key}) : super(key: key);

  @override
  State<AppbarCustom> createState() => _AppbarCustomState();

  @override
  Size get preferredSize => const Size(600, 100);
}

class _AppbarCustomState extends State<AppbarCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Row(
        children: [
          const Text(
            'app bar custom ',
          ),
          CupertinoButton(
            onPressed: () {},
            color: Colors.amber,
            child: const Text('CLick here'),
          ),
        ],
      ),
    );
  }
}
