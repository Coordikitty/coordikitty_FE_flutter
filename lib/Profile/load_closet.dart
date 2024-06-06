import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../dto/restclient.dart';

class LoadCloset extends StatefulWidget {
  const LoadCloset({Key? key}) : super(key: key);

  @override
  _LoadClosetState createState() => _LoadClosetState();
}

class _LoadClosetState extends State<LoadCloset> {
  Map<String, List<String>> categorizedImageUrls = {};
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    fetchImageUrls();
  }
  Future<void> fetchImageUrls() async {
    try {
      final dio = Dio();
      final client = RestClient(dio);

      await client.getCloset();

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = '에러 발생 $e';
        isLoading = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (errorMessage != null) {
      return Center(child: Text(errorMessage!));
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: categorizedImageUrls.entries.map((entry) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.key,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                const SizedBox(height: 20),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
