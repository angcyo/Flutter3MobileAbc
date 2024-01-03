// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter3_app/flutter3_app.dart';

@pragma("vm:entry-point")
void main() {
  testTime();
  /*testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });*/
}

/// 测试循环100w次的耗时
@pragma("vm:entry-point")
void testTime() {
  assert(() {
    var c = 0;
    while (c++ < 10) {
      lTime.tick();
      int count = 10000000 * 10 * (c + 1);
      var sum = 0;
      for (int i = 0; i < count; i++) {
        sum += i;
      }
      l.i('循环$count次:$sum, 耗时:${lTime.time()}');
    }
    return true;
  }());
}
