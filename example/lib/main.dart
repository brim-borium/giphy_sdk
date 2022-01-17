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
  GiphyMedia? _giphyMedia;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var apiKey = dotenv.env['API_KEY'];
            var settings = const GiphySettings.textCreation();
            var media = await GiphySdk.openGiphySelection(
              apiKey: apiKey!,
              giphySettings: settings,
            );
            setState(() {
              _giphyMedia = media;
            });
          },
          child: const Icon(Icons.gif),
        ),
        appBar: AppBar(
          title: const Text('Giphy SDK Example app'),
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    if (_giphyMedia == null) {
      return Center(
        child: Text(
          "No gif selected",
          style: Theme.of(context).textTheme.headline4,
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Information about the selected gif",
            style: Theme.of(context).textTheme.headline4,
          ),
          ListTile(title: Text("id: ${_giphyMedia?.id}")),
          ListTile(title: Text("type: ${_giphyMedia?.type}")),
          ListTile(title: Text("title: ${_giphyMedia?.title}")),
          Text(
            "The selected gif",
            style: Theme.of(context).textTheme.headline4,
          ),
          if (_giphyMedia?.url != null)
            Image.network(
              _giphyMedia?.url as String,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
            )
          else
            const Text("Could not load gif"),
        ],
      ),
    );
  }
}
