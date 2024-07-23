import 'package:flutter/material.dart';
import 'package:flutter_flip_card/controllers/flip_card_controllers.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../constants.dart';
import '../../controllers/app_controller.dart';
import '../../models/tarjeta.dart';
import '../../themes/color_palette.dart';
import '../../widgets/tarjetas/tarjeta_widget.dart';

class DetalleTarjetaScreen extends StatefulWidget {
  const DetalleTarjetaScreen({super.key});

  @override
  State<DetalleTarjetaScreen> createState() => _DetalleTarjetaScreenState();
}

class _DetalleTarjetaScreenState extends State<DetalleTarjetaScreen> {
  final AppController appCtr = Get.find<AppController>();
  final Map<String, dynamic> arguments = Get.arguments as Map<String, dynamic>;
  final GestureFlipCardController flipController = GestureFlipCardController();
  String tarjetaId = '';
  late Tarjeta tarjeta;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      tarjetaId = arguments['tarjetaId'];
      tarjeta = arguments['tarjeta'];
      setState(() {});
    });
  }

  Widget buildSkeleton() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.white,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 335.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: <Widget>[
                  Container(
                    decoration: appCtr.theme.value == themeTipoLight
                        ? ligthLinearGradient
                        : darkLinearGradient,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 90.0,
                      bottom: 60.0,
                      right: 30.0,
                      left: 30.0,
                    ),
                    child: Center(
                      child: tarjetaId.isNotEmpty
                          ? Hero(
                              tag: tarjetaId,
                              child: TarjetaWidget(
                                alto: double.infinity,
                                ancho: double.infinity,
                                tarjetaActual: tarjeta,
                                ctlr: flipController,
                              ),
                            )
                          : buildSkeleton(),
                    ),
                  ),
                ],
              ),
            ),
            centerTitle: true,
            // title: const Text('Detalle tarjeta'),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      if (tarjetaId.isNotEmpty && tarjeta.comentario != null) Text(tarjeta.comentario!),
                      const Text('demás datos'),
                    ],
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
