import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../controllers/app_controller.dart';
import '../../controllers/catalogo_controller.dart';
import '../../controllers/tarjeta_controller.dart';
import '../../models/marca_tarjeta.dart';
import '../../models/tarjeta.dart';
import '../../routes/routes_names.dart';
import '../../themes/color_palette.dart';
import '../../utils/loader.dart';
import '../../utils/modal_utils.dart';
import '../../utils/utils.dart';
import '../../widgets/global/global_banner_info.dart';
import '../../widgets/global/global_button.dart';
import '../../widgets/global/global_seleccion_marca_tarjeta.dart';
import 'form_tarjeta_basico.dart';
import 'form_tarjeta_completo.dart';

class NuevaTarjetaScreen extends StatefulWidget {
  const NuevaTarjetaScreen({super.key});

  @override
  State<NuevaTarjetaScreen> createState() => _NuevaTarjetaScreenState();
}

class _NuevaTarjetaScreenState extends State<NuevaTarjetaScreen> {
  final AppController appCtr = Get.find<AppController>();
  final CatalogoController catCtr = Get.find<CatalogoController>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController tituloController = TextEditingController();
  final MaskedTextController numeroController =
      MaskedTextController(mask: '0000000000000000');
  final TextEditingController titularController = TextEditingController();
  final TextEditingController comentarioController = TextEditingController();
  final MaskedTextController expiracionController =
      MaskedTextController(mask: '00/00');
  final MaskedTextController codigoController =
      MaskedTextController(mask: '0000');
  final TextEditingController diaCorteController = TextEditingController();
  final TextEditingController diaPagoController = TextEditingController();
  List<MarcaTarjeta> marcasTarjetas = <MarcaTarjeta>[];
  bool tipoTarjeta = false;
  bool isLoading = false;
  String tituloError = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      marcasTarjetas = await catCtr.listarMarcasTarjetas();
      setState(() {});
    });
  }

  @override
  void dispose() {
    tituloController.dispose();
    numeroController.dispose();
    titularController.dispose();
    comentarioController.dispose();
    expiracionController.dispose();
    codigoController.dispose();

    diaCorteController.dispose();
    diaPagoController.dispose();
    // _debounce?.cancel();
    super.dispose();
  }

  Future<void> validarFormAltaTarjeta() async {
    try {
      if (appCtr.tarjeta.value.marcaTarjetaId == null) {
        setState(() {
          tituloError = 'Faltan datos';
        });
        throw Exception('Es necesario seleccionar una marca');
      }
      final bool validacion = formKey.currentState!.validate();
      if (validacion) {
        setState(() {
          isLoading = true;
        });
        Loader.mostrar();
        final List<String> fechaExpiracion =
            expiracionController.text.split('/');
        final TarjetaController tarjetaCtr = Get.find<TarjetaController>();
        final Tarjeta tarjeta = Tarjeta(
          numero: numeroController.text.trim(),
          titular: titularController.text.trim(),
          titulo: tituloController.text.trim(),
          color: appCtr.tarjeta.value.color ?? 'morado',
          marcaTarjetaId: appCtr.tarjeta.value.marcaTarjetaId,
          codigoCvv: codigoController.text.trim(),
          comentario: comentarioController.text.trim(),
          mesExpiracion: fechaExpiracion[0],
          anioExpiracion: fechaExpiracion[1],
          diaCorte: diaCorteController.text.trim(),
          diaPago: diaPagoController.text.trim(),
        );
        await tarjetaCtr.agregar(tarjeta: tarjeta);
        await limpiarFormulario();
        Get.back();
        Get.offAllNamed(nameTabsScreen);
      }
    } catch (e) {
      if (isLoading) {
        setState(() {
          tituloError = 'Ocurrió algo inesperado';
        });
        Get.back();
      }
      setState(() {
        isLoading = false;
      });
      ModalUtils.mostrarBottomSheet(
        titulo: 'Ooops!',
        altura: Get.height * 0.6,
        contenido: Center(
          child: GlobalBannerInfo(
            titulo: tituloError,
            informacion: Utils.limpiarException(e),
          ),
        ),
      );
    }
  }

  Future<void> limpiarFormulario() async {
    tituloController.text = '';
    numeroController.text = '';
    titularController.text = '';
    comentarioController.text = '';
    // expiracionController.text = '';
    // codigoController.text = '';
    // diaCorteController.text = '';
    // diaPagoController.text = '';
    await appCtr.limpiarTarjetaActual();
  }

  Future<void> cambiarMarca(MarcaTarjeta val) async {
    // appCtr.marcaTarjeta.value.marcaTarjetaId = val.marcaTarjetaId;
    // appCtr.marcaTarjeta.value.icono = val.icono;
    Get.back();
  }

  Future<void> abrirMarcaSeleccion() async {
    ModalUtils.mostrarBottomSheet(
      titulo: 'Selecciona la marca de tarjeta',
      contenido: GlobalSeleccionMarcaTarjeta(
        onTap: (MarcaTarjeta val) async {
          await cambiarMarca(val);
        },
        marcasTarjetas: marcasTarjetas,
      ),
    );
  }

  Future<void> regresar() async {
    limpiarFormulario();
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            leading: GestureDetector(
              onTap: regresar,
              child: const Icon(Icons.arrow_back),
            ),
            // expandedHeight: 325.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: <Widget>[
                  Obx(
                    () => Container(
                      decoration: appCtr.theme.value == themeTipoLight
                          ? ligthLinearGradient
                          : darkLinearGradient,
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
                        Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              FlutterSwitch(
                                width: 120.0,
                                height: 30.0,
                                valueFontSize: 12,
                                toggleSize: 45.0,
                                value: appCtr.tipoTarjeta.value,
                                borderRadius: 30.0,
                                padding: 5.0,
                                showOnOff: true,
                                inactiveText: 'Basica',
                                activeText: 'Completa',
                                activeColor: Theme.of(context).primaryColor,
                                inactiveColor:
                                    Theme.of(context).colorScheme.secondary,
                                onToggle: (bool val) {
                                  appCtr.tipoTarjeta.value = val;
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        FormTarjetaBasico(
                          tituloController: tituloController,
                          numeroController: numeroController,
                          titularController: titularController,
                          comentarioController: comentarioController,
                          marcasTarjetas: marcasTarjetas,
                        ),
                        Obx(
                          () => appCtr.tipoTarjeta.value
                              ? FormTarjetaCompleto(
                                  diaCorteController: diaCorteController,
                                  diaPagoController: diaPagoController,
                                  expiracionController: expiracionController,
                                  codigoController: codigoController,
                                )
                              : const SizedBox(),
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
