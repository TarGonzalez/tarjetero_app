// ignore_for_file: lines_longer_than_80_chars, avoid_dynamic_calls, always_specify_types

import 'package:dio/dio.dart';
import '../helpers/logger_helper.dart';
import '../utils/utils.dart';
import 'env_reader.dart';

final apiUrl = EnvReader.getApiUrl();
final basePath = EnvReader.getBasePath();
final appMode = EnvReader.getAppMode();
final apiToken = EnvReader.getApiKey();
final String httpString = appMode == 'development' ? 'http://' : 'https://';

final options = BaseOptions(
  baseUrl: '$httpString$apiUrl/$basePath',
  contentType: Headers.jsonContentType,
);
Dio dio = Dio(options);

class ApiHandler {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: '$httpString$apiUrl/$basePath',
      contentType: Headers.jsonContentType,
    ),
  );

  /// Este método realiza la petición get al API
  Future get(
    String modulo,
    String endpoint,
    Map<String, dynamic> filtros,
  ) async {
    try {
      final bool conectado = await Utils.validarConexion();

      if (!conectado) {
        throw Exception(
          'No cuenta con una conexión estable a internet, verifique su conexión',
        );
      }

      // *importante: En caso de que se requiera parametros adicionales
      // filtros.addAll({'param': valor});

      // ! linea para mostrar log de peticiones en consola
      //dio.interceptors.add(LogInterceptor(responseBody: true));
      LoggerHelper.debug('Se listan filtros para petición /$modulo/$endpoint');
      LoggerHelper.debug(filtros);

      String urlModulo = '';
      if (endpoint.isEmpty) {
        urlModulo = modulo;
      } else {
        urlModulo = '$modulo/$endpoint';
      }

      final response = await _dio.get('/$urlModulo', queryParameters: filtros);

      return _getResponseData(response, modulo, endpoint);
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        LoggerHelper.error('Respuesta del servidor con error:');
        LoggerHelper.error(
            'Código de estado: ${dioError.response?.statusCode}');
        LoggerHelper.error('Mensaje: ${dioError.response?.statusMessage}');
      } else {
        LoggerHelper.error('Error de red: ${dioError.message}');
      }

      throw Exception(
          _obtenerMensajeError(dioError.response?.statusCode.toString()));
    } catch (error) {
      rethrow;
    }
  }

  /// Este método realiza la petición post al API
  Future post(
    String modulo,
    String endpoint,
    Map<String, dynamic> parametros, {
    bool isUpload = false,
  }) async {
    try {
      final conectado = await Utils.validarConexion();

      if (!conectado) {
        throw Exception(
          'No cuenta con una conexión estable a internet, verifique su conexión',
        );
      }

      LoggerHelper.debug(
        'Se listan parametros para petición /$modulo/$endpoint',
      );
      LoggerHelper.debug(parametros);

      final Object formData =
          isUpload ? FormData.fromMap(parametros) : parametros;

      final response = await _dio.post(
        '/$modulo/$endpoint',
        data: formData,
      );

      return _getResponseData(response, modulo, endpoint);
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        LoggerHelper.error('Respuesta del servidor con error:');
        LoggerHelper.error(
            'Código de estado: ${dioError.response?.statusCode}');
        LoggerHelper.error('Mensaje: ${dioError.response?.statusMessage}');
      } else {
        LoggerHelper.error('Error de red: ${dioError.message}');
      }

      throw Exception(
          _obtenerMensajeError(dioError.response?.statusCode.toString()));
    } catch (error) {
      rethrow;
    }
  }

  dynamic _getResponseData(Response response, String modulo, String endpoint) {
    final extractedData = response.data;

    if (extractedData == null) {
      return;
    }

    final int codigo = int.parse(extractedData['codigo'].toString());

    if (codigo > 200) {
      throw Exception(extractedData['mensaje']);
    }

    if (response.statusCode == 200) {
      return extractedData['datos'];
    }

    throw Exception('Error realizando petición $modulo/$endpoint');
  }

  static String _obtenerMensajeError(String? status) {
    String mensaje = 'Codigo: $status';
    switch (status) {
      case '404':
        mensaje += ', Recurso no encontrado';
        break;
      case '405':
        mensaje += ', Método no permitido';
        break;
      case '500':
        mensaje += ', Error interno de servidor';
        break;
      default:
        mensaje += ', Ocurrio un error en la petición';
    }
    return mensaje;
  }
}
