import 'package:flutter_test/flutter_test.dart';

import 'package:watch_it_app/main.dart';

void main() {
  testWidgets('App launches successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const WatchItApp());
    await tester.pumpAndSettle();
  });
}
