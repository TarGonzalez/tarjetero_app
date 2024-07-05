import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '/controllers/login_controller.dart';
import '/routes/routes_names.dart';
import '/themes/color_palette.dart';
import '/utils/modal_utils.dart';
import '/utils/utils.dart';
import '/widgets/global/global_banner_info.dart';
import '/widgets/global/global_button.dart';
import '/widgets/global/global_progress.dart';
import '/widgets/global/gradiant_app_bar.dart';
import '/widgets/global/input_label.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  TextEditingController usuarioCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();
  LoginController loginCtr = Get.find<LoginController>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> _verificarDatos() async {
    try {
      if (formKey.currentState!.validate()) {
        setState(() {
          _isLoading = true;
        });
        final bool logeado = await loginCtr.inciarSesion(
          usuario: usuarioCtr.text.trim(),
          password: passwordCtr.text.trim(),
        );
        if (logeado) {
          await _irHome();
        } else {
          ModalUtils.mostrarBottomSheet(
            titulo: 'Opps!',
            altura: Get.height * 0.5,
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
        altura: Get.height * 0.5,
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
    Get.offNamed(nameTabsScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GradientAppBar(
          title: Text('Login'), boxDecoration: ligthLinearGradient),
      body: SafeArea(
        child: SizedBox.expand(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(child: InputLabel(texto: 'Usuario')),
                    TextFormField(
                      controller: usuarioCtr,
                      validator: (String? val) {
                        if (val!.isEmpty) {
                          return 'Usuario es necesario';
                        }
                        return null;
                      },
                    ),
                    const MaxGap(30),
                    const InputLabel(texto: 'Password'),
                    TextFormField(
                      controller: passwordCtr,
                      obscureText: true,
                      validator: (String? val) {
                        if (val!.isEmpty) {
                          return 'Password es necesario';
                        }
                        return null;
                      },
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
                          ? Column(
                              children: <Widget>[
                                GlobalButton(
                                  texto: 'Login',
                                  onPressed: _verificarDatos,
                                ),
                                const Gap(15),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      '¿No cuentas con una cuenta?',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                    ),
                                    SizedBox(
                                      width: 80,
                                      child: GlobalButton(
                                        accion: 'sinBorde',
                                        texto: 'Registrarse',
                                        onPressed: _irHome,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : const GlobalProgress(size: 50),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
