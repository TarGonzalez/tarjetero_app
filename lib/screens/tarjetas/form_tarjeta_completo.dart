import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../utils/fecha_utils.dart';
import '/controllers/app_controller.dart';
import '/widgets/global/input_label.dart';

class FormTarjetaCompleto extends StatefulWidget {
  const FormTarjetaCompleto({
    super.key,
    required this.diaCorteController,
    required this.diaPagoController,
    required this.expiracionController,
    required this.codigoController,
  });
  final TextEditingController diaCorteController;
  final TextEditingController diaPagoController;
  final MaskedTextController expiracionController;
  final TextEditingController codigoController;

  @override
  State<FormTarjetaCompleto> createState() => _FormTarjetaCompletoState();
}

class _FormTarjetaCompletoState extends State<FormTarjetaCompleto> {
  final AppController appCtr = Get.find<AppController>();
  Widget setEspaciador({double? altura}) {
    return SizedBox(height: altura ?? 20);
  }

  Future<void> cambiarFechaPago(DateTime val) async {
    final String fechaFormateada =
        FechaUtils.getFormatoFecha(fecha: val, conHora: false, tipo: 'dia');
    widget.diaPagoController.text = fechaFormateada;
  }

  Future<void> cambiarFechaCorte(DateTime val) async {
    final String fechaFormateada =
        FechaUtils.getFormatoFecha(fecha: val, conHora: false, tipo: 'dia');
    widget.diaCorteController.text = fechaFormateada;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
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
                    controller: widget.diaCorteController,
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
                        pickerModel: CustomDayPicker(
                          currentTime:
                              DateFormat('DD').parse(DateTime.now().toString()),
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
                    controller: widget.diaPagoController,
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
                        pickerModel: CustomDayPicker(
                          currentTime:
                              DateFormat('DD').parse(DateTime.now().toString()),
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
                    controller: widget.expiracionController,
                    maxLength: 5,
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
                      final int? yearPart = int.tryParse(parts[1]);
                      final String currentYear = DateTime.now().year.toString();
                      final String century = currentYear.substring(0, 2);
                      final int? year = int.tryParse('$century$yearPart');

                      if (month == null ||
                          year == null ||
                          month < 1 ||
                          month > 12) {
                        return 'Fecha no válida';
                      }
                      final DateTime now = DateTime.now();
                      final DateTime inputDate = DateTime(year, month);

                      if (inputDate.isBefore(DateTime(now.year, now.month))) {
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
                    textInputAction: TextInputAction.done,
                    controller: widget.codigoController,
                    keyboardType: TextInputType.number,
                    maxLength: 4,
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
      ],
    );
  }
}

class CustomDayPicker extends DatePickerModel {
  CustomDayPicker(
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
