import 'package:flutter/material.dart';

/*게시물 등록 버튼*/
class PostButton extends StatelessWidget {
  final String text;
  final bool isClicked;
  final VoidCallback onTap;

  const PostButton({
    Key? key,
    required this.text,
    required this.isClicked,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imagePath;
    if (text == 'closet') {
      imagePath = isClicked ? 'image/selected_closet.png' : 'image/closet.png';
    } else {
      imagePath = isClicked ? 'image/selected_post.png' : 'image/post.png';
    }

    return InkWell(
      onTap: onTap,
      child: ImageIcon(
        AssetImage(imagePath),
        size: 20,
      ),
    );
  }
}
