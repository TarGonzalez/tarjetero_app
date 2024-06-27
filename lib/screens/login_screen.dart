import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../routes/routes_names.dart';
import '../themes/color_palette.dart';
import '../widgets/global/global_progress.dart';
import '/widgets/global/global_button.dart';
import '/widgets/global/gradiant_app_bar.dart';
import '/widgets/global/input_label.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  Future<void> _irHome() async {
    setState(() {
      _isLoading = true;
    });
    await Future<void>.delayed(const Duration(milliseconds: 2500));
    setState(() {
      _isLoading = false;
    });
    Get.offNamed(nameTabsScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GradientAppBar(title: Text('Login'), boxDecoration: ligthLinearGradient),
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
                  TextFormField(
                    obscureText: true,
                  ),
                  const MaxGap(30),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return ScaleTransition(
                        scale: animation,
                        child: child,
                      );
                    },
                    child: !_isLoading
                        ? GlobalButton(
                            texto: 'Login',
                            onPressed: _irHome,
                          )
                        : const GlobalProgress(size: 50),
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
