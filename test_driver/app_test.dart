// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Login form tests', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    var email = find.byValueKey('loginEmail');
    var phone = find.byValueKey('loginPhone');
    var send = find.byValueKey('sendLogin');

    // TODO: write tests
    test('login form test', () async {
      //Case-1 не верный email
      await driver.tap(email);
      await driver.enterText('test@email');
      await driver.tap(phone);
      await driver.enterText('8800800800');
      await driver.tap(send);
      driver.waitFor(find.text('Поле email заполнено не корректно'));

      //Case-2 верный email и корректный телефон
      await driver.tap(email);
      await driver.enterText('test@email.com');
      await driver.tap(phone);
      await driver.enterText('asd');
      await driver.tap(send);
      driver.waitFor(find.text('Введите телефон'));
      //Водим корректный телефон
      await driver.tap(phone);
      await driver.enterText('8800800800');
      await driver.tap(send);
      driver.waitFor(find.text('Добро пожаловать'));
    });
  });

  group('Rigister form tests', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    var buttonMain = find.byValueKey('login_view_button');

    var fName = find.byValueKey('firstName');
    var sName = find.byValueKey('secondName');
    var email = find.byValueKey('email');
    var phone = find.byValueKey('phone');
    var submit = find.byValueKey('submit');

    test('register_test', () async {
      //Case 1 не заполены first_name and last_name
      await driver.tap(buttonMain);
      await driver.tap(submit);
      driver.waitFor(find.text('Введите имя'));
      driver.waitFor(find.text('Введите фамилию'));

      //Case 2 phone содержит цифры
      await driver.tap(phone);
      await driver.enterText('8800800800asd');
      driver.waitFor(find.text('8800800800'));

      //Case 3 надпись вы успешно зарегестрировались
      await driver.tap(fName);
      await driver.enterText('Name');
      await driver.tap(sName);
      await driver.enterText('SName');
      await driver.tap(email);
      await driver.enterText('emai@email.com');
      await driver.tap(phone);
      await driver.enterText('8800800800');
      await driver.tap(submit);
      driver.waitFor(find.text('Вы успешно зарегистрировались'));
    });
  });
}
