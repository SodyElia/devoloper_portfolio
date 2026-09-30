// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:developer_portfolio/main.dart';

void main() {
  testWidgets('renders the portfolio home page', (WidgetTester tester) async {
    await tester.pumpWidget(const DeveloperPortfolioApp());

    expect(find.text('Elia Sody'), findsOneWidget);
    expect(find.text('Flutter Developer'), findsOneWidget);
    expect(find.text('Projects I Have Built'), findsOneWidget);
    expect(find.text('BiasharaPro'), findsOneWidget);
  });
}
