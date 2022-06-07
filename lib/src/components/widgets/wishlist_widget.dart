import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const _size = 24.0;

class WishlistWiidget extends StatefulWidget {
  final bool isChecked;

  const WishlistWiidget({
    Key? key,
    this.isChecked = false,
  }) : super(key: key);

  @override
  State<WishlistWiidget> createState() => _WishlistWiidgetState();
}

class _WishlistWiidgetState extends State<WishlistWiidget> {
  late bool _isSlected;

  void _onTap() {
    setState(() {
      _isSlected = !_isSlected;
    });
  }

  @override
  void initState() {
    _isSlected = widget.isChecked;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        width: _size,
        height: _size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(6),
        child: SvgPicture.asset(
          _isSlected
              ? 'assets/icons/ic_wishlist.svg'
              : 'assets/icons/ic_wishlisted.svg',
        ),
      ),
    );
  }
}
