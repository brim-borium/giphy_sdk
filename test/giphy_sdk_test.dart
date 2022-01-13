import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:giphy_sdk/giphy_sdk.dart';

void main() {
  const MethodChannel channel = MethodChannel('giphy_sdk');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await GiphySdk.connectToGiphy(apiKey: ""), true);
  });
}
