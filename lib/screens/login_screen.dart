import 'package:control_gastos_tarjetas/widgets/global/input_label.dart';
import 'package:flutter/material.dart';
import '../widgets/global/the_app_bar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TheAppBar(titulo: 'Login'),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(child: InputLabel(texto: 'Usuario')),
              TextFormField(
                
              ),
              const InputLabel(texto: 'Password'),
            ],
          ),
        ),
      ),
    );
  }
}
