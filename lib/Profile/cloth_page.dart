import 'dart:html';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

import '../dto/closetdto.dart';
import '../dto/restclient.dart';

class ClothPage extends StatefulWidget {
  const ClothPage({Key? key}) : super(key: key);

  @override
  State<ClothPage> createState() => _ClothPageState();
}

class _ClothPageState extends State<ClothPage> {
  final _formKey = GlobalKey<FormState>();
  Large? _large;
  Medium? _medium;
  Small? _small;
  Fit? _fit;
  Gender? _gender;
  Style? _style;
  Thickness? _thickness;
  XFile? _imageFile;

  String enumToString(Object? enumValue) {
    return enumValue?.toString().split('.').last ?? '';
  }

  final ImagePicker _picker = ImagePicker();

  void _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery, // Select image from gallery
      maxHeight: 75,
      maxWidth: 75,
      imageQuality: 30,
    );

    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
      });
    }
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      if (_imageFile == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('이미지를 선택해주세요')),
        );
        return;
      }

      try {
        final dio = Dio(); // Initialize Dio client
        final restClient = RestClient(dio); // Create RestClient instance

        final closetPostRequestDto = ClosetPostRequestDto(
          large: enumToString(_large),
          medium: enumToString(_medium),
          small: enumToString(_small),
          fit: enumToString(_fit),
          gender: enumToString(_gender),
          style: enumToString(_style),
          thickness: enumToString(_thickness),
        );

        final Uint8List imageBytes = await _imageFile!.readAsBytes();

        final multipartFile = MultipartFile.fromBytes(
          imageBytes,
          filename: _imageFile!.name,
          contentType: MediaType('image', _imageFile!.path.split('.').last),
        );

        final closetPostDto = ClosetPostDTO(
          closetPostRequestDto: closetPostRequestDto,
          clothImg: _imageFile!.name,
        );

        await restClient.closetPost(closetPostDto, multipartFile);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('옷이 등록되었습니다')),
        );
      } catch (e) {
        print('Error uploading cloth: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('옷을 업로드하는데 오류가 발생했습니다')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('옷 등록'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _imageFile == null
                    ? const Text('No image selected.')
                    : Image.network(_imageFile!.path),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: _pickImage,
                    child: const Text('이미지 선택'),
                  ),
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<Large>(
                  decoration: const InputDecoration(labelText: '대분류 (Large)'),
                  items: Large.values
                      .map((large) => DropdownMenuItem(
                    value: large,
                    child: Text(large.toString().split('.').last),
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _large = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return '대분류를 선택하세요.';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<Medium>(
                  decoration: const InputDecoration(labelText: '중분류 (Medium)'),
                  items: Medium.values
                      .map((medium) => DropdownMenuItem(
                    value: medium,
                    child: Text(medium.toString().split('.').last),
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _medium = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return '중분류를 선택하세요.';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<Small>(
                  decoration: const InputDecoration(labelText: '소분류 (Small)'),
                  items: Small.values
                      .map((small) => DropdownMenuItem(
                    value: small,
                    child: Text(small.toString().split('.').last),
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _small = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return '소분류를 선택하세요.';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<Fit>(
                  decoration: const InputDecoration(labelText: '핏 (Fit)'),
                  items: Fit.values
                      .map((fit) => DropdownMenuItem(
                    value: fit,
                    child: Text(fit.toString().split('.').last),
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _fit = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return '핏을 선택하세요.';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<Gender>(
                  decoration: const InputDecoration(labelText: '성별 (Gender)'),
                  items: Gender.values
                      .map((gender) => DropdownMenuItem(
                    value: gender,
                    child: Text(gender.toString().split('.').last),
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return '성별을 선택하세요.';
                    }
                    return null;
                  },
                ),
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
                DropdownButtonFormField<Thickness>(
                  decoration: const InputDecoration(labelText: '두께 (Thickness)'),
                  items: Thickness.values
                      .map((thickness) => DropdownMenuItem(
                    value: thickness,
                    child: Text(thickness.toString().split('.').last),
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _thickness = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return '두께를 선택하세요.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    child: const Text('등록'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}