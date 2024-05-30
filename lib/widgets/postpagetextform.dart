import 'package:flutter/material.dart';

class PostPageTextForm extends StatefulWidget {
  const PostPageTextForm({super.key});

  @override
  _PostPageTextFormState createState() => _PostPageTextFormState();
}

class _PostPageTextFormState extends State<PostPageTextForm> {
  final _formKey = GlobalKey<FormState>();
  String _clothingType = '';
  String _color = '';
  String _season = '';
  String _style = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: '옷 종류'),
              onSaved: (value) {
                _clothingType = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: '색상'),
              onSaved: (value) {
                _color = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: '계절'),
              onSaved: (value) {
                _season = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: '스타일'),
              onSaved: (value) {
                _style = value!;
              },
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    print('옷 종류: $_clothingType');
                    print('색상: $_color');
                    print('계절: $_season');
                    print('스타일: $_style');
                  }
                },
                child: Text('등록'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
