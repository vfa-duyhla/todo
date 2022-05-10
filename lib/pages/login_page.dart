import 'package:flutter/material.dart';
import 'package:flutter_application_1/mobx/login_mobx.dart';
import 'package:flutter_application_1/value/app_assets.dart';
import 'package:flutter_application_1/widgets/app_textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginMobx = LoginMobx();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 200, child: Image.asset(AppAssets.imgLogo)),
                const SizedBox(height: 30.0),
                AppTextField(
                  label: 'Username',
                  icon: const Icon(Icons.people),
                  controller: loginMobx.usernameController,
                  emptyText: 'Please enter your username',
                ),
                const SizedBox(height: 10.0),
                AppTextField(
                  label: 'Password',
                  icon: const Icon(Icons.lock),
                  isPassword: true,
                  controller: loginMobx.passwordController,
                  emptyText: 'Please enter your password',
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () => loginMobx.login(context),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
