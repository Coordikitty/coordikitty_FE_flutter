import 'package:flutter/material.dart';

class LoadCloset extends StatelessWidget {
  const LoadCloset({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, List<String>> categorizedImageUrls = {
      'OUTER': [
        'https://example.com/outer1.jpg',
        'https://example.com/outer2.jpg',
      ],
      'TOP': [
        'https://example.com/top1.jpg',
        'https://example.com/top2.jpg',
      ],
      'PANTS': [
        'https://example.com/pants1.jpg',
        'https://example.com/pants2.jpg',
      ],
      'SKIRT': [
        'https://example.com/skirt1.jpg',
        'https://example.com/skirt2.jpg',
      ],
      'DRESS': [
        'https://example.com/dress1.jpg',
        'https://example.com/dress2.jpg',
      ],
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: categorizedImageUrls.entries.map((entry) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              entry.key,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
              ),
              itemCount: entry.value.length,
              itemBuilder: (context, index) {
                return Image.network(
                  entry.value[index],
                  fit: BoxFit.cover,
                );
              },
            ),
            SizedBox(height: 20),
          ],
        );
      }).toList(),
    );
  }
}
