// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:integration_test/integration_test.dart';
// import 'package:tallisbusiness_bank__app/main.dart';
// import 'package:tallisbusiness_bank__app/resources/app_persistance/app_local.dart';
// import 'dart:math';

// Future<void> D(int time) async {
//   await Future.delayed(Duration(seconds: time));
// }

// String generateRandomCode() {
//   const characters =
//       'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
//   final random = Random();
//   return List.generate(
//       8, (index) => characters[random.nextInt(characters.length)]).join();
// }

// void main() async {
//   IntegrationTestWidgetsFlutterBinding.ensureInitialized();
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//   ]);
//   await AppLocal.ins.initStorage();
//   group('Testa fluxo do onboarding normal', () {
//     testWidgets('Testa fluxo do onboarding normal', (
//       tester,
//     ) async {
//       await tester.pumpWidget(const ProviderScope(child: MyApp()));
//       await tester.pumpAndSettle();
//       await D(5);
//       await tester.tap(find.text('Sign Up'));
//       await tester.pumpAndSettle();

//       await D(5);
//       await tester.tap(find.text('New account'));
//       await tester.pumpAndSettle();

//       await D(5);
//       await tester.enterText(find.byType(TextFormField), generateRandomCode());
//       await D(2);
//       await tester.tap(find.text('Continue'));
//       await D(10);
//       await tester.pumpAndSettle();

//       // // Verify the counter starts at 0.
//       // expect(find.text('0'), findsOneWidget);

//       // // Finds the floating action button to tap on.
//       // final fab = find.byKey(const ValueKey('increment'));

//       // // Emulate a tap on the floating action button.
//       // await tester.tap(fab);

//       // // Trigger a frame.
//       // await tester.pumpAndSettle();

//       // // Verify the counter increments by 1.
//       // expect(find.text('1'), findsOneWidget);
//     // });
//   });
// }
