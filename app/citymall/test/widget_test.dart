import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:citymall/main.dart';
import 'package:citymall/screens/onboarding_screen.dart';

void main() {
  testWidgets('Splash screen and navigation to onboarding smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our splash screen shows the app title.
    expect(find.text('Apna Dukan'), findsOneWidget);
    expect(find.text('Shop your city'), findsOneWidget);

    // Wait for the timer to complete and for the navigation to happen.
    await tester.pumpAndSettle();

    // Verify that we have navigated to the onboarding screen.
    expect(find.byType(OnboardingScreen), findsOneWidget);
  });
}
