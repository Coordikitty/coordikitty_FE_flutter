import 'package:flutter/material.dart';

class MyprofileButton extends StatefulWidget {
  const MyprofileButton({
    super.key,
    required this.text,
    required this.isClicked,
    required this.onTap
  });

  final String text;
  final bool isClicked;
  final VoidCallback onTap;

  @override
  _MyprofileButton createState() => _MyprofileButton();
}

class _MyprofileButton extends State<MyprofileButton> {
  late bool _isClicked;

  @override
  void initState() {
    super.initState();
    _isClicked = widget.isClicked;
  }

  void _handleTap() {
    widget.onTap();
    setState(() {
      _isClicked =! _isClicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    String imagePath;
    if(widget.text == 'closet') {
      imagePath = _isClicked ? 'image/selected_closet.png' : 'image/closet.png';
    } else {
      imagePath = _isClicked ? 'image/selected_post.png' : 'image/post.png';
    }

    return InkWell(
      onTap: _handleTap,
      child: ImageIcon(
        AssetImage(imagePath),
        size: 20,
      ),
    );
  }
}
