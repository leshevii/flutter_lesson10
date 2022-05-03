// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing/views/login_view.dart';
import 'package:testing/main.dart' as app;

void main() {
  //Unit-test login_form
  group('Login view tests', () {
    testWidgets("test login_form", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: LoginView(),
        localizationsDelegates: [
          DefaultMaterialLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
        ],
      ));

      // TODO: write tests
      await tester.tap(find.byKey(Key('sendLogin')));
      await tester.pump();
      expect(find.text('Введите email'), findsOneWidget);
      await tester.enterText(find.byKey(Key('loginEmail')), 'asd');
      await tester.tap(find.byKey(Key('sendLogin')));
      await tester.pump();
      expect(find.text('Поле email заполнено не корректно'), findsOneWidget);
      await tester.enterText(
          find.byKey(Key('loginEmail')), 'testing@email.com');
      await tester.enterText(find.byKey(Key('loginPhone')), '8800800800');
      await tester.tap(find.byKey(Key('sendLogin')));
      await tester.pump();
      expect(find.text('Добро пожаловать'), findsOneWidget);
    });
  });

  //Unit-test register_form
  group('Register view test', () {
    testWidgets('test register_form', (WidgetTester tester) async {
      app.main();
      await tester.pump();
      var buttonMain = find.byKey(Key('login_view_button'));
      await tester.tap(buttonMain);
      await tester.pump();

      var fName = find.byKey(Key('firstName'));
      var sName = find.byKey(Key('secondName'));
      var email = find.byKey(Key('email'));
      var phone = find.byKey(Key('phone'));
      var submit = find.byKey(Key('submit'));

      await tester.tap(submit);
      await tester.pump();
      expect(find.text('Вы успешно зарегистрировались'), findsNothing);
      await tester.enterText(fName, 'Name');
      await tester.enterText(sName, 'SName');
      await tester.enterText(phone, '8800800800');
      await tester.enterText(email, 'test@email.com');
      await tester.tap(submit);
      await tester.pump();
      expect(find.text('Вы успешно зарегистрировались'), findsOneWidget);
    });
  });
}
