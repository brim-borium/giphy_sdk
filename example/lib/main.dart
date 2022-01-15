import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:giphy_sdk/giphy_sdk.dart';
import 'package:giphy_sdk/models/giphy_media.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GiphyMedia? _giphyMedia;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            var apiKey = dotenv.env['API_KEY'];
            setState(() async {
              _giphyMedia = await GiphySdk.openGiphySelection(apiKey: apiKey!);
            });
          },
          child: const Icon(Icons.connect_without_contact),
        ),
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    if (_giphyMedia == null) {
      return const Center(
        child: Text("No gif selected"),
      );
    }

    return Column(
      children: [
        Text("Selected gif id: ${_giphyMedia?.id}"),
        Text("Selected gif title: ${_giphyMedia?.title}"),
        Text("Selected bitly url : ${_giphyMedia?.bitlyGifUrl}"),
      ],
    );
  }
}
