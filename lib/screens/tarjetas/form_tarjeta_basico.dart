import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../constants.dart';
import '/controllers/app_controller.dart';
import '/helpers/color_helper.dart';
import '/models/marca_tarjeta.dart';
import '/utils/modal_utils.dart';
import '/widgets/global/global_seleccion_color.dart';
import '/widgets/global/global_seleccion_marca_tarjeta.dart';
import '/widgets/global/input_label.dart';
import '/widgets/tarjetas/marca_icono_widget.dart';

class FormTarjetaBasico extends StatefulWidget {
  const FormTarjetaBasico({
    super.key,
    required this.tituloController,
    required this.numeroController,
    required this.titularController,
    required this.comentarioController,
    required this.marcasTarjetas,
  });
  final TextEditingController tituloController;
  final MaskedTextController numeroController;
  final TextEditingController titularController;
  final TextEditingController comentarioController;
  final List<MarcaTarjeta> marcasTarjetas;

  @override
  State<FormTarjetaBasico> createState() => _FormTarjetaBasicoState();
}

class _FormTarjetaBasicoState extends State<FormTarjetaBasico> {
  final AppController appCtr = Get.find<AppController>();
  Widget setEspaciador({double? altura}) {
    return SizedBox(height: altura ?? 20);
  }

  Widget buildSkeletonMarcaIcon() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.white,
      child: Container(
        width: 122,
        height: 33,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }

  Future<void> abrirColorSeleccion() async {
    ModalUtils.mostrarBottomSheet(
      titulo: 'Selecciona tu color favorito',
      contenido: GlobalSeleccionColor(onTap: (String val) {
        appCtr.tarjeta.value.color = val;
        setState(() {});
        Get.back();
      }),
    );
  }

  Future<void> abrirMarcaSeleccion() async {
    ModalUtils.mostrarBottomSheet(
      titulo: 'Selecciona la marca de tarjeta',
      contenido: GlobalSeleccionMarcaTarjeta(
        marcasTarjetas: widget.marcasTarjetas,
        onTap: (MarcaTarjeta val) {
          appCtr.tarjeta.value.marcaTarjetaId = val.marcaTarjetaId;
          appCtr.tarjeta.value.icono = val.icono;
          setState(() {});
          Get.back();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const InputLabel(texto: 'Título de la tarjeta'),
        TextFormField(
          textInputAction: TextInputAction.next,
          controller: widget.tituloController,
          maxLength: 30,
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
          controller: widget.numeroController,
          keyboardType: TextInputType.number,
          maxLength: 16,
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
          controller: widget.titularController,
          maxLength: 50,
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
            Row(
              children: <Widget>[
                Text(
                  'Color',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
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
                      width: 52,
                      height: 32,
                      decoration: BoxDecoration(
                        color: ColorHelper.obtenerColor(
                            appCtr.tarjeta.value.color ?? 'morado'),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (widget.marcasTarjetas.isNotEmpty)
              Row(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      abrirMarcaSeleccion();
                    },
                    child: Obx(
                      () => MarcaIconoWidget(
                        ancho: 52,
                        alto: 32,
                        icono: appCtr.tarjeta.value.icono,
                        colorBackground: appCtr.theme.value == themeTipoLight
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Marca',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontSize: 16,
                        ),
                  ),
                ],
              )
            else
              buildSkeletonMarcaIcon(),
          ],
        ),
        setEspaciador(),
        const InputLabel(texto: 'Descripción / comentario'),
        Obx(
          () => TextFormField(
            controller: widget.comentarioController,
            textInputAction: !appCtr.tipoTarjeta.value
                ? TextInputAction.done
                : TextInputAction.next,
            maxLength: 200,
            maxLines: 3,
          ),
        ),
      ],
    );
  }
}
