import 'package:flix_id/data/dummies/dummy_authentication.dart';
import 'package:flix_id/data/dummies/dummy_user_repository.dart';
import 'package:flix_id/presentation/pages/main_page/main_page.dart';
import 'package:flutter/material.dart';

import '../../../domain/usecases/login/login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Login login = Login(
              authentication: DummyAuthentication(),
              userRepository: DummyUserRepository(),
            );
            login(LoginParams(email: "email", password: "password"))
                .then((result) {
              if (result.isSuccess) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MainPage(user: result.resultValue!)));
              }
            });
          },
          child: const Text('login'),
        ),
      ),
    );
  }
}
