import 'package:intl/intl.dart';

class FechaUtils {
  static String getFormatoFecha(
      {required DateTime fecha, bool conHora = true}) {
    String fechaFormat;
    if (conHora) {
      fechaFormat = DateFormat('dd/MM/yyyy hh:mm').format(fecha);
    } else {
      fechaFormat = DateFormat('dd/MM/yyyy').format(fecha);
    }
    return fechaFormat;
  }
}
