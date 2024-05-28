import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:get/get.dart';

import '../../controllers/tarjeta_controller.dart';
import '../../models/tarjeta.dart';
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
    final GestureFlipCardController flipController = GestureFlipCardController();
    // final TextEditingController tituloCtr = TextEditingController();
    // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    // late TextEditingController numeroCtr = TextEditingController();
    // late TextEditingController titularCtr = TextEditingController();
    // late TextEditingController expiracionCtr = TextEditingController();
    // late TextEditingController codigoCtr = TextEditingController();

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
      );
    }

    Future<void> cambiarCodigo(String val) async {
      final Tarjeta tarjetaActual = tarjetaController.tarjetaActual;
      tarjetaController.tarjetaActual =
          tarjetaController.tarjetaActual.copyWith(
        titulo: tarjetaActual.titulo,
        numero: tarjetaActual.numero,
        titular: tarjetaActual.titular,
        expiracion: tarjetaActual.codigo,
        codigo: val,
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
              background: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 60.0,
                  horizontal: 30,
                ),
                child: Obx(
                  () => TarjetaWidget(
                    tarjetaActual: tarjetaController.tarjetaActual,
                    ctlr: flipController,
                  ),
                ),
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
                    // key: _formKey,
                    child: Column(
                      children: <Widget>[
                        const InputLabel(texto: 'Título de la tarjeta'),
                        TextFormField(
                          onChanged: (String val) async {
                            await cambiarTitulo(val);
                          },
                        ),
                        setEspaciador(),
                        const InputLabel(texto: 'Número de la tarjeta'),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          maxLength: 16,
                          onChanged: (String val) async {
                            await cambiarNumero(val);
                          },
                          decoration: const InputDecoration(
                              hintText: 'Recuerde son 16 dígitos'),
                        ),
                        setEspaciador(),
                        const InputLabel(texto: 'Nombre del titular'),
                        TextFormField(
                          onChanged: (String val) async {
                            await cambiarTitular(val);
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
                                  // const InputLabel(texto: 'Fecha de expiración'),
                                  TextFormField(
                                    onChanged: (String val) async {
                                      await cambiarExpiracion(val);
                                    },
                                    decoration: const InputDecoration(
                                      labelText: 'Fecha de expiración',
                                      hintText: 'MM/AA',
                                    ),
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
                                    keyboardType: TextInputType.number,
                                    maxLength: 4,
                                    onChanged: (String val) async {
                                      await cambiarCodigo(val);
                                    },
                                    onTap: () async {
                            await flipController.flipcard();
                          }
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
                                  const InputLabel(texto: 'Color'),
                                  TextFormField(),
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
                                  // const InputLabel(texto: '´Marca'),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                        labelText: 'Marca'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        setEspaciador(),
                        const InputLabel(texto: 'Comentarios'),
                        TextFormField(
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
    );
  }
}
