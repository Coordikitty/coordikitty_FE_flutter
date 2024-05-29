import 'package:flutter/material.dart';

class HomeButton extends StatefulWidget {
  const HomeButton({
    super.key,
    required this.text,
    required this.isLiked,
    required this.onTap,
  });

  final String text;
  final bool isLiked;
  final VoidCallback onTap;

  @override
  _HomeButtonState createState() => _HomeButtonState();
}

class _HomeButtonState extends State<HomeButton> {
  late bool _isLiked;

  @override
  void initState() {
    super.initState();
    _isLiked = widget.isLiked;
  }

  void _handleTap() {
    widget.onTap();
    setState(() {
      _isLiked = !_isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    String imagePath;
    if (widget.text == 'Like') {
      imagePath = _isLiked ? 'image/heart_filled.png' : 'image/heart.png';
    } else {
      imagePath = _isLiked ? 'image/bookmark_filled.png' : 'image/bookmark.png';
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
