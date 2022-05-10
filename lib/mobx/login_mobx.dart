import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';
part 'login_mobx.g.dart';

String exampleUser = 'admin';
String examplePassword = 'password';
class LoginMobx = _LoginMobxStore with _$LoginMobx;

abstract class _LoginMobxStore with Store {
  @observable
  var usernameController = TextEditingController();

  @observable
  var passwordController = TextEditingController();

  @action
  Future login(BuildContext context) {
    if (usernameController.text == exampleUser &&
        passwordController.text == examplePassword) {
      usernameController.text = '';
      passwordController.text = '';
      return Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    }
    return Fluttertoast.showToast(msg: 'Wrong username or password');
  }
}
