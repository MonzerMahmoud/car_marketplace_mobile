import 'package:car_marketplace_mobile/modules/auth/auth_action.dart';
import 'package:car_marketplace_mobile/modules/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class AuthPage extends GetWidget<AuthController> {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [ 
          
          const Expanded(flex: 1 ,child: Center(child: Text('Cars Marketplace'))),
          
          Expanded(
            flex: 2,
            child: Obx(
              () => controller.currentPage.value == AuthPageEnum.login
                  ? LoginPage(
                      controller: controller,
                    )
                  : RegisterPage(
                      controller: controller,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  LoginPage({
    super.key,
    required this.controller,
  });

  final AuthController controller;
  String? username;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        TextFormField(
          decoration: const InputDecoration(hintText: 'Username'),
          onChanged: (value) => username = value,
        ),
        const SizedBox(height: 16),
        TextFormField(
          decoration: const InputDecoration(hintText: 'Password'),
          onChanged: (value) => password = value,
        ),
        const SizedBox(height: 64),
        TextButton(
            onPressed: () {
          AuthAction.signInPressed(username!, password!);
            },
            child: const Text('Login')),
        const Spacer(),
        TextButton(
          onPressed: () {
            controller.currentPage.value = AuthPageEnum.register;
          },
          child: const Text('Do not Have Account? Register'),
        ),
      ],
    );
  }
}

class RegisterPage extends StatelessWidget {
  RegisterPage({
    super.key,
    required this.controller,
  });

  final AuthController controller;
  String? username;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        TextFormField(
          decoration: const InputDecoration(hintText: 'Username'),
          onChanged: (value) => username = value,
        ),
        const SizedBox(height: 16),
        TextFormField(
          decoration: const InputDecoration(hintText: 'Password'),
          onChanged: (value) => password = value,
        ),
        const SizedBox(height: 64),
        TextButton(
          onPressed: () {
            AuthAction.signUpPressed(
              username!,
              password!,
            );
          },
          child: const Text('Register'),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            controller.currentPage.value = AuthPageEnum.login;
          },
          child: const Text('Already Have an account ? Login'),
        ),
      ],
    );
  }
}
