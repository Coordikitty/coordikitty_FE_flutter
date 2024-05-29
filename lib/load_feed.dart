import 'package:flutter/material.dart';

class LoadFeed extends StatelessWidget {
  const LoadFeed({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> imageUrls = [
      'image/feed1.png',
      'image/feed2.png',
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
      ),
      itemCount: imageUrls.length,
      itemBuilder: (context, index) {
        return Image.network(
          imageUrls[index],
          fit: BoxFit.cover,
        );
      },
    );
  }
}
