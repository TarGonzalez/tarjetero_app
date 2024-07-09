import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controllers/tarjeta_controller.dart';
import '../../helpers/color_helper.dart';
import '../../themes/color_palette.dart';
import '../../utils/fecha_utils.dart';
import '../../utils/loader.dart';
import '../../utils/modal_utils.dart';
import '../../widgets/global/global_button.dart';
import '../../widgets/global/global_seleccion_color.dart';
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

    final TextEditingController diaCorteController = TextEditingController();
    final TextEditingController diaPagoController = TextEditingController();

    Widget setEspaciador({double? altura}) {
      return SizedBox(height: altura ?? 30);
    }

    Future<void> cambiarTitulo(String val) async {
      await tarjetaController.cambiarTitulo(val);
    }

    Future<void> cambiarNumero(String val) async {
      await tarjetaController.cambiarNumero(val);
    }

    Future<void> cambiarTitular(String val) async {
      await tarjetaController.cambiarTitular(val);
    }

    Future<void> cambiarExpiracion(String val) async {
      await tarjetaController.cambiarExpiracion(val);
    }

    Future<void> cambiarCodigo(String val) async {
      await tarjetaController.cambiarCodigo(val);
    }

    Future<void> cambiarColor(String val) async {
      await tarjetaController.cambiarColor(val);
      Get.back();
    }

    Future<void> cambiarFechaCorte(DateTime val) async {
      final String fechaFormateada =
          FechaUtils.getFormatoFecha(fecha: val, conHora: false, tipo: 'dia');
      diaCorteController.text = fechaFormateada;
      await tarjetaController.cambiarFechaCorte(fechaFormateada);
    }

    Future<void> cambiarFechaPago(DateTime val) async {
      final String fechaFormateada =
          FechaUtils.getFormatoFecha(fecha: val, conHora: false, tipo: 'dia');
      diaPagoController.text = fechaFormateada;
      await tarjetaController.cambiarFechaPago(fechaFormateada);
    }

    Future<void> limpiarFormulario() async {
      tituloController.text = '';
      numeroController.text = '';
      titularController.text = '';
      expiracionController.text = '';
      codigoController.text = '';
      diaCorteController.text = '';
      diaPagoController.text = '';
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

    Future<void> abrirColorSeleccion() async {
      ModalUtils.mostrarBottomSheet(
        titulo: 'Selecciona tu color favorito',
        contenido: GlobalSeleccionColor(
          onTap: (String val) => cambiarColor(val),
        ),
      );
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
                  Container(
                    decoration: ligthLinearGradient,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 90.0,
                      bottom: 75.0,
                      right: 40.0,
                      left: 40.0,
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
                        InkWell(
                          onTap: () {
                            abrirColorSeleccion();
                          },
                          child: Obx(
                            () => Container(
                              width: 36,
                              height: 26,
                              decoration: BoxDecoration(
                                color: ColorHelper.obtenerColor(
                                    tarjetaController.tarjetaActual.color ??
                                        'morado'),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
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
                          textInputAction: TextInputAction.next,
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
                          textInputAction: TextInputAction.next,
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
                          textInputAction: TextInputAction.next,
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
                                    texto: 'Día de corte',
                                  ),
                                  TextFormField(
                                    textInputAction: TextInputAction.next,
                                    readOnly: true,
                                    decoration: const InputDecoration(
                                      hintText: 'DD',
                                    ),
                                    controller: diaCorteController,
                                    validator: (String? val) {
                                      if (val!.isEmpty) {
                                        return 'Introduzca día de corte';
                                      }
                                      return null;
                                    },
                                    onTap: () {
                                      picker.DatePicker.showPicker(
                                        context,
                                        locale: picker.LocaleType.es,
                                        pickerModel: CustomMonthPicker(
                                          currentTime: DateFormat('DD')
                                              .parse(DateTime.now().toString()),
                                          minTime: DateTime(2023),
                                          maxTime: DateTime(2023, 1, 28),
                                          locale: picker.LocaleType.es,
                                        ),
                                        onConfirm: (DateTime date) async {
                                          await cambiarFechaCorte(date);
                                        },
                                      );
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
                                  const InputLabel(texto: 'Día de pago'),
                                  TextFormField(
                                    textInputAction: TextInputAction.next,
                                    readOnly: true,
                                    decoration: const InputDecoration(
                                      hintText: 'DD',
                                    ),
                                    controller: diaPagoController,
                                    validator: (String? val) {
                                      if (val!.isEmpty) {
                                        return 'Introduzca día de pago';
                                      }
                                      return null;
                                    },
                                    onTap: () {
                                      picker.DatePicker.showPicker(
                                        context,
                                        locale: picker.LocaleType.es,
                                        pickerModel: CustomMonthPicker(
                                          currentTime: DateFormat('DD')
                                              .parse(DateTime.now().toString()),
                                          minTime: DateTime(2023),
                                          maxTime: DateTime(2023, 1, 28),
                                          locale: picker.LocaleType.es,
                                        ),
                                        onConfirm: (DateTime date) async {
                                          await cambiarFechaPago(date);
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        setEspaciador(altura: 50),
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
                                    textInputAction: TextInputAction.next,
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
                                    textInputAction: TextInputAction.next,
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
                        const InputLabel(texto: 'Marca'),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                        ),
                        setEspaciador(),
                        const InputLabel(texto: 'Comentarios'),
                        TextFormField(
                          textInputAction: TextInputAction.done,
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
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        child: GlobalButton(
          texto: 'Guardar',
          onPressed: validarFormAltaTarjeta,
        ),
      ),
    );
  }
}

class CustomMonthPicker extends DatePickerModel {
  CustomMonthPicker(
      {required DateTime currentTime,
      required DateTime minTime,
      required DateTime maxTime,
      required LocaleType locale})
      : super(
            locale: locale,
            minTime: minTime,
            maxTime: maxTime,
            currentTime: currentTime);

  @override
  List<int> layoutProportions() {
    return <int>[0, 0, 1];
  }
}
