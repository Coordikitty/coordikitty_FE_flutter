import 'package:flutter/material.dart';

class RecommendPage extends StatefulWidget {
  const RecommendPage({Key? key}) : super(key: key);

  @override
  _RecommendPageState createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  String _selectedOption = '기본'; // 기본값 설정
  String _topImageUrl = 'image/clothes/top1.png';
  String _bottomImageUrl = 'image/clothes/pants1.png';

  void _selectOption(String? option) {
    setState(() {
      _selectedOption = option ?? '기본'; // 선택한 옵션이 없을 경우 기본값으로 설정
    });
    // TODO: 여기에 선택한 옵션에 따라 옷 추천 이미지 가져오는 로직 추가
    // _fetchRecommendationImages(option);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('오늘의 추천'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedOption,
                items: ['기본', '스타일', '상황별', '날씨별']
                    .map<DropdownMenuItem<String>>(
                      (value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  ),
                )
                    .toList(),
                onChanged: _selectOption,
              ),
              SizedBox(height: 32),
              if (_topImageUrl.isNotEmpty) ...[
                Text('Top'),
                SizedBox(height: 8),
                Image.network(
                  _topImageUrl,
                  height: 350,
                  width: 350,
                  fit: BoxFit.cover,
                ),
              ],
              SizedBox(height: 16),
              if (_bottomImageUrl.isNotEmpty) ...[
                Text('Bottom'),
                SizedBox(height: 8),
                Image.network(
                  _bottomImageUrl,
                  height: 350,
                  width: 350,
                  fit: BoxFit.cover,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
