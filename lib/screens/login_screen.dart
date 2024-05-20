import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../routes/routes_names.dart';
import '/widgets/global/global_button.dart';
import '/widgets/global/input_label.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _irHome() {
    Get.toNamed(nameTabsScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SafeArea(
        child: SizedBox.expand(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(child: InputLabel(texto: 'Usuario')),
                  TextFormField(),
                  const MaxGap(30),
                  const InputLabel(texto: 'Password'),
                  TextFormField(),
                  const MaxGap(30),
                  GlobalButton(
                    texto: 'Login',
                    onPressed: _irHome,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
