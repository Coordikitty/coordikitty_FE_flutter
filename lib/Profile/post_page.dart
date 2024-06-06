import 'package:coordikitty_fe_flutter/dto/restclient.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import '../Auth/style.dart';
import '../dto/postdto.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _captionController = TextEditingController();
  Style? _style;
  final TextEditingController _styleController = TextEditingController();
  XFile? _imageFile;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = pickedFile;
    });
  }

  String enumToString(Object? enumValue) {
    return enumValue?.toString().split('.').last ?? '';
  }

  Future<void> _submitPost() async {
    if (_formKey.currentState?.validate() ?? false) {
      if (_imageFile == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('이미지를 선택해주세요')),
        );
        return;
      }

      try {
        final dio = Dio();
        final restClient = RestClient(dio);

        List<String> imageUrls = [_imageFile!.path];

        final postUploadDTO = PostUploadDTO(
          postUploadRequestDto: PostUploadRequestDTO(
            content: _captionController.text,
            style: _styleController.text,
            clothIds: [],
          ),
          postImgs: [_imageFile!.path],
        );

        final response = await restClient.uploadPost(postUploadDTO);


        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('게시물이 업로드 되었습니다')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('업로드 실패: $e')),
        );
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('새 게시물'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              GestureDetector(
                onTap: _pickImage,
                child: _imageFile == null
                    ? Container(
                  height: 200,
                  color: Colors.grey[300],
                  child: Icon(Icons.add_a_photo, color: Colors.white, size: 50),
                )
                    : Image.network(_imageFile!.path, height: 200, fit: BoxFit.cover),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _captionController,
                decoration: InputDecoration(
                  labelText: '문구',
                  prefixIcon: Icon(Icons.text_fields),
                ),
              ),
              SizedBox(height: 16.0),
              DropdownButtonFormField<Style>(
                decoration: const InputDecoration(labelText: '스타일 (Style)'),
                items: Style.values
                    .map((style) => DropdownMenuItem(
                  value: style,
                  child: Text(style.toString().split('.').last),
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _style = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return '스타일을 선택하세요.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitPost,
                child: Text('공유'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum Style { FORMAL, MINIMALISTIC, CASUAL, STREET, SPORTS }