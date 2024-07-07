import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '/controllers/login_controller.dart';
import '/routes/routes_names.dart';
import '/utils/modal_utils.dart';
import '/utils/utils.dart';
import '/widgets/global/global_banner_info.dart';
import '/widgets/global/global_button.dart';
import '/widgets/global/global_progress.dart';
import '/widgets/global/gradient_app_bar.dart';
import '/widgets/global/input_label.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isLoading = false;
  TextEditingController nombresCtr = TextEditingController();
  TextEditingController apellidosCtr = TextEditingController();
  TextEditingController emailCtr = TextEditingController();
  TextEditingController usuarioCtr = TextEditingController();
  TextEditingController passCtr = TextEditingController();
  TextEditingController passVerificarCtr = TextEditingController();
  LoginController loginCtr = Get.find<LoginController>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nombresCtr.dispose();
    apellidosCtr.dispose();
    emailCtr.dispose();
    usuarioCtr.dispose();
    passCtr.dispose();
    passVerificarCtr.dispose();
    super.dispose();
  }

  Future<void> _verificarDatos() async {
    try {
      if (formKey.currentState!.validate()) {
        setState(() {
          _isLoading = true;
        });
        final bool logeado = await loginCtr.registrarse(
          nombres: nombresCtr.text.trim(),
          apellidos: nombresCtr.text.trim(),
          email: nombresCtr.text.trim(),
          usuario: usuarioCtr.text.trim(),
          password: passCtr.text.trim(),
        );
        if (logeado) {
          await _irHome();
        } else {
          ModalUtils.mostrarBottomSheet(
            titulo: 'Opps!',
            altura: Get.height * 0.6,
            contenido: const GlobalBannerInfo(
              informacion: 'No se pudo terminar su acción',
            ),
          );
        }
        setState(() {
          _isLoading = true;
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ModalUtils.mostrarBottomSheet(
        titulo: 'Opps!',
        altura: Get.height * 0.6,
        contenido: Center(
          child: GlobalBannerInfo(
            informacion: Utils.limpiarException(e),
          ),
        ),
      );
    }
  }

  Future<void> _irHome() async {
    setState(() {
      _isLoading = true;
    });
    await Future<void>.delayed(const Duration(milliseconds: 2500));
    setState(() {
      _isLoading = false;
    });
    Get.offAllNamed(nameTabsScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GradientAppBar(
        title: 'Registro',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const InputLabel(texto: 'Nombre/s'),
                SizedBox(
                  height: 74,
                  child: TextFormField(
                    controller: nombresCtr,
                    textInputAction: TextInputAction.next,
                    validator: (String? val) {
                      if (val!.isEmpty) {
                        return 'Tu nombre es necesario';
                      }
                      return null;
                    },
                  ),
                ),
                const Gap(15),
                const InputLabel(texto: 'Apellido/s'),
                SizedBox(
                  height: 74,
                  child: TextFormField(
                    controller: apellidosCtr,
                    textInputAction: TextInputAction.next,
                    validator: (String? val) {
                      if (val!.isEmpty) {
                        return 'Tu apellido es necesario';
                      }
                      return null;
                    },
                  ),
                ),
                const Gap(15),
                const InputLabel(texto: 'Email'),
                SizedBox(
                  height: 74,
                  child: TextFormField(
                    controller: emailCtr,
                    textInputAction: TextInputAction.next,
                    validator: (String? val) {
                      if (val!.isEmpty) {
                        return 'Tu email es necesario';
                      }
                      if (!Utils.validarEmail(email: val)) {
                        return 'El email es inválido, verifique su email';
                      }
                      return null;
                    },
                  ),
                ),
                const Gap(15),
                const InputLabel(texto: 'Usuario'),
                SizedBox(
                  height: 74,
                  child: TextFormField(
                    controller: usuarioCtr,
                    textInputAction: TextInputAction.next,
                    validator: (String? val) {
                      if (val!.isEmpty) {
                        return 'Usuario es necesario';
                      }
                      return null;
                    },
                  ),
                ),
                const Gap(15),
                const InputLabel(texto: 'Password'),
                SizedBox(
                  height: 74,
                  child: TextFormField(
                    controller: passCtr,
                    textInputAction: TextInputAction.next,
                    obscureText: true,
                    validator: (String? val) {
                      if (val!.isEmpty) {
                        return 'Password es necesario';
                      }
                      return null;
                    },
                  ),
                ),
                const Gap(15),
                const InputLabel(texto: 'Confirmar password'),
                SizedBox(
                  height: 74,
                  child: TextFormField(
                    controller: passVerificarCtr,
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                    validator: (String? val) {
                      if (val!.isEmpty) {
                        return 'Confirma tu password';
                      }
                      if (val.compareTo(passCtr.text) != 0) {
                        return 'El password no coincide';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            },
            child: !_isLoading
                ? Column(
                    children: <Widget>[
                      GlobalButton(
                        onPressed: _verificarDatos,
                      ),
                    ],
                  )
                : const GlobalProgress(size: 50),
          ),
        ),
      ),
    );
  }
}
