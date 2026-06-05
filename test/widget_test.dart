import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:zen_health/provider/provider_age.dart';
import 'package:zen_health/provider/provider_height.dart';
import 'package:zen_health/provider/provider_male_female.dart';
import 'package:zen_health/provider/provider_weight.dart';
import 'package:zen_health/main.dart';

void main() {
  testWidgets('App starts with Splash Screen smoke test', (WidgetTester tester) async {
    // Set standard mobile screen size to avoid layout overflows in test
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ProviderMaleFemale()),
          ChangeNotifierProvider(create: (context) => ProviderHeight()),
          ChangeNotifierProvider(create: (context) => ProviderWeight()),
          ChangeNotifierProvider(create: (context) => ProviderAge()),
        ],
        child: const MyApp(),
      ),
    );

    // Verify that Splash Screen text is displayed.
    expect(find.text('ZEN HEALTH'), findsOneWidget);

    // Let the splash screen timer run to completion and transition to the next screen.
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();
  });
}
