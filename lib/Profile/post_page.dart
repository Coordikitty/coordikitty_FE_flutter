import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../widgets/postpagetextform.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  File? _image;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('옷 등록'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _image == null
                  ? Text('No image selected.')
                  : Image.file(_image!),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.camera_alt),
                    iconSize: 50,
                    onPressed: () => _pickImage(ImageSource.camera),
                  ),
                  SizedBox(width: 20),
                  IconButton(
                    icon: Icon(Icons.photo),
                    iconSize: 50,
                    onPressed: () => _pickImage(ImageSource.gallery),
                  ),
                ],
              ),
              SizedBox(height: 20),
              PostPageTextForm()
            ],
          ),
        ),
      ),
    );
  }
}
