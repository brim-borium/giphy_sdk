import 'package:flutter/material.dart';
import 'package:giphy_sdk/giphy_sdk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            GiphySdk.openGiphySelection(
                apiKey: "Yy07HnfovRAbW0jpROqjGtKK2FczRa8l");
          },
          child: const Icon(Icons.connect_without_contact),
        ),
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: const Center(
          child: Text('Implement the sample'),
        ),
      ),
    );
  }
}
