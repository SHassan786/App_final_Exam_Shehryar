// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:finalexam/main.dart';
import 'package:finalexam/pages/sample_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() async {
  setUpAll(() => {loadAppFonts()});
  testGoldens('DeviceBuilder - multiple scenarios - with onCreate',
      (tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [
        Device.phone,
        Device.tabletPortrait,
        Device.tabletLandscape,
      ])
      // Choose the page here that I need to test
      ..addScenario(
        widget: EarPodsUI(),
        name: 'sc page',
      );
    //flutter test --update-goldens
    await tester.pumpDeviceBuilder(
      builder,
      wrapper: materialAppWrapper(
        theme: ThemeData.light(),
        platform: TargetPlatform.android,
      ),
    );

    await screenMatchesGolden(tester, 'firt_screen_shot');
  });
}
