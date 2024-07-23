import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
import '../../app_assets.dart';
import '../../helpers/color_helper.dart';
import '../../helpers/tarjeta_helper.dart';
import '../../models/tarjeta.dart';
import 'marca_icono_widget.dart';

class TarjetaWidget extends StatefulWidget {
  const TarjetaWidget({
    super.key,
    this.ancho = 300.0,
    this.alto = 200,
    required this.tarjetaActual,
    required this.ctlr,
    this.mostrarOpciones = false,
    this.onEdit,
  });

  final double ancho;
  final double alto;
  final Tarjeta tarjetaActual;
  final GestureFlipCardController ctlr;
  final bool mostrarOpciones;
  final VoidCallback? onEdit;

  @override
  State<TarjetaWidget> createState() => _TarjetaWidgetState();
}

class _TarjetaWidgetState extends State<TarjetaWidget> {
  bool ocultarInformacion = true;
  @override
  Widget build(BuildContext context) {
    Future<void> voltearCard() async {
      widget.ctlr.flipcard();
    }

    return GestureDetector(
      onTap: () async {
        await voltearCard();
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: widget.ancho,
                height: widget.alto,
                child: GestureFlipCard(
                  animationDuration: const Duration(milliseconds: 300),
                  controller: widget.ctlr,
                  enableController: true,
                  // key: GlobalKey(),
                  frontWidget: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: ColorHelper.obtenerColor(
                          widget.tarjetaActual.color ?? 'morado'),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              widget.tarjetaActual.titulo != null
                                  ? widget.tarjetaActual.titulo!
                                  : '',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  ocultarInformacion = !ocultarInformacion;
                                });
                              },
                              child: Icon(
                                ocultarInformacion == true
                                    ? Icons.visibility_off_rounded
                                    : Icons.visibility_rounded,
                                size: 26,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.tarjetaActual.titular != null
                              ? widget.tarjetaActual.titular!
                              : '',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(flex: 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: 55,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.transparent,
                              ),
                              child: Image.asset(
                                AppAssets.iconChip,
                                fit: BoxFit.cover,
                              ),
                            ),
                            MarcaIconoWidget(
                              alto: 40,
                              ancho: 60,
                              icono: widget.tarjetaActual.icono,
                            ),
                          ],
                        ),
                        const Spacer(flex: 2),
                        Text(
                          widget.tarjetaActual.ultimosDigitos != null
                              ? TarjetaHelper.numeroMostrar(
                                  numero: widget.tarjetaActual.numero!,
                                  ultimosDigitos:
                                      widget.tarjetaActual.ultimosDigitos!,
                                  ocultarInformacion: ocultarInformacion,
                                )
                              : '',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                color: Colors.white,
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  backWidget: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: ColorHelper.obtenerColor(
                          widget.tarjetaActual.color ?? 'morado'),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        const SizedBox(height: 10),
                        Container(
                          color: Colors.white,
                          width: double.infinity,
                          height: 30,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            widget.tarjetaActual.titulo != null
                                ? widget.tarjetaActual.titulo!.toUpperCase()
                                : '',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  color: Colors.black87,
                                ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Válido hasta',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                ),
                                Text(
                                  widget.tarjetaActual.anioExpiracion != null
                                      ? TarjetaHelper.fechaExpMostrar(
                                          anio: widget
                                              .tarjetaActual.anioExpiracion!,
                                          mes: widget
                                              .tarjetaActual.mesExpiracion!,
                                          ocultarInformacion:
                                              ocultarInformacion,
                                        )
                                      : '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  'CVV',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                ),
                                Text(
                                  widget.tarjetaActual.codigoCvv != null
                                      ? TarjetaHelper.codigoMostrar(
                                          codigoCvv: widget
                                              .tarjetaActual.codigoCvv
                                              .toString(),
                                          ocultarInformacion:
                                              ocultarInformacion,
                                        )
                                      : '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Día de corte',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                ),
                                Text(
                                  widget.tarjetaActual.diaCorte != null
                                      ? widget.tarjetaActual.diaCorte!
                                      : '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  'Día de pago',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                ),
                                Text(
                                  widget.tarjetaActual.diaPago != null
                                      ? widget.tarjetaActual.diaPago!
                                      : '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (widget.mostrarOpciones)
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      widget.onEdit!();
                    },
                    child: const Icon(
                      Icons.edit,
                      size: 30,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Icon(
                    Icons.share,
                    size: 30,
                  ),
                  const SizedBox(height: 12),
                  const Icon(
                    Icons.remove_red_eye,
                    size: 30,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
