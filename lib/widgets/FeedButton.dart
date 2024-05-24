/*import 'package:flutter/material.dart';

class FeedButton extends StatelessWidget {
  const FeedButton({
    super.key,
    required this.text,
    this.isLiked = false,
    required this.onTap,
  });

  final String text;
  final bool isLiked;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ImageIcon(
        AssetImage(
          text == 'Like'
              ? (isLiked ? 'image/heart_filled.png' : 'image/heart.png')
              : 'image/bookmark.png',
        ),
        size: 20,
      ),
    );
  }
}*/

import 'package:flutter/material.dart';

class FeedButton extends StatefulWidget {
  const FeedButton({
    super.key,
    required this.text,
    required this.isLiked,
    required this.onTap,
  });

  final String text;
  final bool isLiked;
  final VoidCallback onTap;

  @override
  _FeedButtonState createState() => _FeedButtonState();
}

class _FeedButtonState extends State<FeedButton> {
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
    } else if (widget.text == 'Bookmark') {
      imagePath = _isLiked ? 'image/bookmark_filled.png' : 'image/bookmark.png';
    } else {
      imagePath = 'image/default.png';
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
