import 'package:intl/intl.dart';

class FechaUtils {
  static String getFormatoFecha(
      {required DateTime fecha, bool conHora = true, int tipo = 1}) {
    String fechaMask;
    String fechaFormat;
    switch (tipo) {
      // 01/01
      case 2:
        fechaMask = 'MM/dd';
        break;
      // Ene/01
      case 3:
        fechaMask = 'MMM/dd';
        break;
      // 01/01/0000
      default:
        fechaMask = 'dd/MM/yyyy';
    }
    if (conHora) {
      fechaFormat = DateFormat('$fechaMask hh:mm').format(fecha);
    } else {
      fechaFormat = DateFormat(fechaMask).format(fecha);
    }
    return fechaFormat;
  }
}
