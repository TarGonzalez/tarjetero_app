import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class TarjetaHelper {
  static String ponerMascaraNumero({required String numero}) {
    final MaskedTextController mask =
        MaskedTextController(text: numero, mask: '0000    0000    0000    0000');
    return mask.text;
  }
}
