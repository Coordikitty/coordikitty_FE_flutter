// cloth.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../dto/Profile/cloth.dart';

class Cloth extends StatefulWidget {
  const Cloth({super.key});

  @override
  State<Cloth> createState() => _ClothState();
}

class _ClothState extends State<Cloth> {
  final _formKey = GlobalKey<FormState>();
  Large? _large;
  Medium? _medium;
  Small? _small;
  Fit? _fit;
  Gender? _gender;
  Style? _style;
  Thickness? _thickness;
  XFile? _imageFile;

  final ImagePicker _picker = ImagePicker();
  final ClothService _clothService = ClothService();

  void _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
      });
    }
  }

  String enumToString(Object? enumValue) {
    return enumValue?.toString().split('.').last ?? '';
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
        await _clothService.submitForm(
          _imageFile!,
          enumToString(_large),
          enumToString(_medium),
          enumToString(_small),
          enumToString(_fit),
          enumToString(_gender),
          enumToString(_style),
          enumToString(_thickness),
        );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('옷이 등록되었습니다')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('옷을 업로드하는데 오류가 발생했습니다: $e')),
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
                    : Image.file(File(_imageFile!.path)),
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

enum Large { OUTER, TOPS, BOTTOMS, SHOES, ACCESSORIES }
enum Medium { COAT, JACKET, HOODIE, T_SHIRT, JEANS, SHORTS, SNEAKERS, BOOTS, SCARF, HAT }
enum Small { SMALL1, SMALL2, SMALL3 }
enum Fit { SLIM, REGULAR, LOOSE }
enum Gender { MALE, FEMALE }
enum Style { CASUAL, FORMAL, SPORTS }
enum Thickness { LIGHT, MEDIUM, HEAVY }
