import 'package:flutter/material.dart';
import 'package:flutter_color_picker_wheel/flutter_color_picker_wheel.dart';
import 'package:flutter_color_picker_wheel/models/button_behaviour.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart' as picker;
import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';

import '../../controllers/tarjeta_controller.dart';
import '../../models/tarjeta.dart';
import '../../utils/fecha_utils.dart';
import '../../utils/loader.dart';
import '../../widgets/global/global_button.dart';
import '../../widgets/global/input_label.dart';
import '../../widgets/tarjetas/tarjeta_widget.dart';

class NuevaTarjetaScreen extends StatefulWidget {
  const NuevaTarjetaScreen({super.key});

  @override
  State<NuevaTarjetaScreen> createState() => _NuevaTarjetaScreenState();
}

class _NuevaTarjetaScreenState extends State<NuevaTarjetaScreen> {
  @override
  Widget build(BuildContext context) {
    final TarjetaController tarjetaController = Get.find<TarjetaController>();
    final GestureFlipCardController flipController =
        GestureFlipCardController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final TextEditingController tituloController = TextEditingController();
    final MaskedTextController numeroController =
        MaskedTextController(mask: '0000000000000000');
    final TextEditingController titularController = TextEditingController();
    final MaskedTextController expiracionController =
        MaskedTextController(mask: '00/00');
    final MaskedTextController codigoController =
        MaskedTextController(mask: '0000');

    final TextEditingController fechaPagoController =
        TextEditingController();

    Widget setEspaciador({double? altura}) {
      return SizedBox(height: altura ?? 30);
    }

    Future<void> cambiarTitulo(String val) async {
      final Tarjeta tarjetaActual = tarjetaController.tarjetaActual;
      tarjetaController.tarjetaActual =
          tarjetaController.tarjetaActual.copyWith(
        titulo: val,
        numero: tarjetaActual.numero,
        titular: tarjetaActual.titular,
        expiracion: tarjetaActual.expiracion,
        codigo: tarjetaActual.codigo,
        color: tarjetaActual.color,
      );
    }

    Future<void> cambiarNumero(String val) async {
      final Tarjeta tarjetaActual = tarjetaController.tarjetaActual;
      tarjetaController.tarjetaActual =
          tarjetaController.tarjetaActual.copyWith(
        titulo: tarjetaActual.titulo,
        numero: val,
        titular: tarjetaActual.titular,
        expiracion: tarjetaActual.expiracion,
        codigo: tarjetaActual.codigo,
        color: tarjetaActual.color,
      );
    }

    Future<void> cambiarTitular(String val) async {
      final Tarjeta tarjetaActual = tarjetaController.tarjetaActual;
      tarjetaController.tarjetaActual =
          tarjetaController.tarjetaActual.copyWith(
        titulo: tarjetaActual.titulo,
        numero: tarjetaActual.numero,
        titular: val,
        expiracion: tarjetaActual.expiracion,
        codigo: tarjetaActual.codigo,
        color: tarjetaActual.color,
      );
    }

    Future<void> cambiarExpiracion(String val) async {
      final Tarjeta tarjetaActual = tarjetaController.tarjetaActual;
      tarjetaController.tarjetaActual =
          tarjetaController.tarjetaActual.copyWith(
        titulo: tarjetaActual.titulo,
        numero: tarjetaActual.numero,
        titular: tarjetaActual.titular,
        expiracion: val,
        codigo: tarjetaActual.codigo,
        color: tarjetaActual.color,
      );
    }

    Future<void> cambiarCodigo(String val) async {
      final Tarjeta tarjetaActual = tarjetaController.tarjetaActual;
      tarjetaController.tarjetaActual =
          tarjetaController.tarjetaActual.copyWith(
        titulo: tarjetaActual.titulo,
        numero: tarjetaActual.numero,
        titular: tarjetaActual.titular,
        expiracion: tarjetaActual.expiracion,
        codigo: val,
        color: tarjetaActual.color,
      );
    }

    Future<void> cambiarColor(Color val) async {
      final Tarjeta tarjetaActual = tarjetaController.tarjetaActual;
      tarjetaController.tarjetaActual =
          tarjetaController.tarjetaActual.copyWith(
        titulo: tarjetaActual.titulo,
        numero: tarjetaActual.numero,
        titular: tarjetaActual.titular,
        expiracion: tarjetaActual.expiracion,
        codigo: tarjetaActual.codigo,
        color: val,
      );
    }

    Future<void> limpiarFormulario() async {
      tituloController.text = '';
      numeroController.text = '';
      titularController.text = '';
      expiracionController.text = '';
      codigoController.text = '';
      await tarjetaController.limpiarTarjetaActual();
    }

    Future<void> validarFormAltaTarjeta() async {
      final bool validacion = formKey.currentState!.validate();
      if (validacion) {
        Loader.mostrar();
        await Future<void>.delayed(const Duration(seconds: 3));
        Get.back();
        await limpiarFormulario();
      }
    }

    return Scaffold(
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 325.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 80.0,
                      horizontal: 30,
                    ),
                    child: Obx(
                      () => Center(
                        child: TarjetaWidget(
                          alto: double.infinity,
                          ancho: double.infinity,
                          tarjetaActual: tarjetaController.tarjetaActual,
                          ctlr: flipController,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 30,
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Color',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                        ),
                        const SizedBox(width: 12),
                        WheelColorPicker(
                          onSelect: (Color newColor) async {
                            await cambiarColor(newColor);
                          },
                          behaviour: ButtonBehaviour.clickToOpen,
                          defaultColor: Colors.lightBlue,
                          animationConfig: fanLikeAnimationConfig,
                          // colorList: const <List<Color>>[
                          //   <Color>[
                          //     Colors.red,
                          //     Colors.redAccent,
                          //     Colors.deepOrange
                          //   ],
                          //   <Color>[
                          //     Colors.black26,
                          //     Colors.black45,
                          //     Colors.black87
                          //   ],
                          //   <Color>[
                          //     Colors.blue,
                          //     Colors.blueAccent,
                          //     Colors.blueGrey
                          //   ],
                          //   <Color>[
                          //     Colors.deepPurpleAccent,
                          //     Colors.purpleAccent
                          //   ],
                          // ],
                          colorList: simpleColors,
                          buttonSize: 40,
                          pieceHeight: 15,
                          innerRadius: 80,
                          stickToButton: false,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            centerTitle: true,
            title: const Text('Nueva tarjeta'),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        const InputLabel(texto: 'Título de la tarjeta'),
                        TextFormField(
                          controller: tituloController,
                          maxLength: 30,
                          onChanged: (String val) async {
                            await cambiarTitulo(val);
                          },
                          validator: (String? val) {
                            if (val!.isEmpty) {
                              return 'Introduzca un título a su tarjeta';
                            }
                            return null;
                          },
                        ),
                        setEspaciador(),
                        const InputLabel(texto: 'Número de la tarjeta'),
                        TextFormField(
                          controller: numeroController,
                          keyboardType: TextInputType.number,
                          maxLength: 16,
                          onChanged: (String val) async {
                            await cambiarNumero(val);
                          },
                          decoration: const InputDecoration(
                            hintText: 'Recuerde son 16 dígitos',
                          ),
                          validator: (String? val) {
                            if (val!.isEmpty) {
                              return 'Introduzca el número de tarjeta';
                            }
                            if (val.length != 16) {
                              return 'Deben ser 16 dígitos';
                            }
                            return null;
                          },
                        ),
                        setEspaciador(),
                        const InputLabel(texto: 'Nombre del titular'),
                        TextFormField(
                          controller: titularController,
                          maxLength: 50,
                          onChanged: (String val) async {
                            await cambiarTitular(val);
                          },
                          validator: (String? val) {
                            if (val!.isEmpty) {
                              return 'Introduzca el titular de la tarjeta';
                            }
                            return null;
                          },
                        ),
                        setEspaciador(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              flex: 5,
                              child: Column(
                                children: <Widget>[
                                  const InputLabel(
                                    texto: 'Fecha de corte',
                                  ),
                                  TextFormField(
                                    controller: expiracionController,
                                    maxLength: 5,
                                    onChanged: (String val) async {
                                      await cambiarExpiracion(val);
                                    },
                                    decoration: const InputDecoration(
                                      hintText: 'MM/AA',
                                    ),
                                    validator: (String? val) {
                                      if (val!.isEmpty) {
                                        return 'Requerido';
                                      }

                                      final List<String> parts = val.split('/');
                                      if (parts.length != 2) {
                                        return 'Formato incorrecto';
                                      }

                                      final int? month = int.tryParse(parts[0]);
                                      final int? yearPart =
                                          int.tryParse(parts[1]);
                                      final String currentYear =
                                          DateTime.now().year.toString();
                                      final String century =
                                          currentYear.substring(0, 2);
                                      final int? year =
                                          int.tryParse('$century$yearPart');

                                      if (month == null ||
                                          year == null ||
                                          month < 1 ||
                                          month > 12) {
                                        return 'Fecha no válida';
                                      }
                                      final DateTime now = DateTime.now();
                                      final DateTime inputDate =
                                          DateTime(year, month);

                                      if (inputDate.isBefore(
                                          DateTime(now.year, now.month))) {
                                        return 'Fecha expiró';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const Flexible(
                              child: SizedBox(),
                            ),
                            Expanded(
                              flex: 5,
                              child: Column(
                                children: <Widget>[
                                  const InputLabel(texto: 'Fecha de pago'),
                                  TextFormField(
                                    readOnly: true,
                                    controller: fechaPagoController,
                                    onTap: () {
                                      picker.DatePicker.showDatePicker(
                                        context,
                                        minTime: DateTime(2023),
                                        maxTime: DateTime(2050, 12),
                                        locale: picker.LocaleType.es,
                                        onConfirm: (DateTime date) {
                                          print(date);
                                          final formateada = FechaUtils.getFormatoFecha(fecha: date);
                                          print(formateada);
                                        }
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        setEspaciador(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              flex: 5,
                              child: Column(
                                children: <Widget>[
                                  const InputLabel(
                                    texto: 'Fecha de expiración',
                                  ),
                                  TextFormField(
                                    controller: expiracionController,
                                    maxLength: 5,
                                    onChanged: (String val) async {
                                      await cambiarExpiracion(val);
                                    },
                                    decoration: const InputDecoration(
                                      hintText: 'MM/AA',
                                    ),
                                    validator: (String? val) {
                                      if (val!.isEmpty) {
                                        return 'Requerido';
                                      }

                                      final List<String> parts = val.split('/');
                                      if (parts.length != 2) {
                                        return 'Formato incorrecto';
                                      }

                                      final int? month = int.tryParse(parts[0]);
                                      final int? yearPart =
                                          int.tryParse(parts[1]);
                                      final String currentYear =
                                          DateTime.now().year.toString();
                                      final String century =
                                          currentYear.substring(0, 2);
                                      final int? year =
                                          int.tryParse('$century$yearPart');

                                      if (month == null ||
                                          year == null ||
                                          month < 1 ||
                                          month > 12) {
                                        return 'Fecha no válida';
                                      }
                                      final DateTime now = DateTime.now();
                                      final DateTime inputDate =
                                          DateTime(year, month);

                                      if (inputDate.isBefore(
                                          DateTime(now.year, now.month))) {
                                        return 'Fecha expiró';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const Flexible(
                              child: SizedBox(),
                            ),
                            Expanded(
                              flex: 5,
                              child: Column(
                                children: <Widget>[
                                  const InputLabel(texto: 'CVV'),
                                  TextFormField(
                                    controller: codigoController,
                                    keyboardType: TextInputType.number,
                                    maxLength: 4,
                                    onChanged: (String val) async {
                                      await cambiarCodigo(val);
                                    },
                                    validator: (String? val) {
                                      if (val!.isEmpty) {
                                        return 'Requerido';
                                      }
                                      if (val.length < 3) {
                                        return 'Código inválido';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        setEspaciador(),
                        const InputLabel(texto: '´Marca'),
                        TextFormField(),
                        setEspaciador(),
                        const InputLabel(texto: 'Comentarios'),
                        TextFormField(
                          maxLength: 200,
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
        child: GlobalButton(
          texto: 'Guardar',
          onPressed: validarFormAltaTarjeta,
        ),
      ),
    );
  }
}
