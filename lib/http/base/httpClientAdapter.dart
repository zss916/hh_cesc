import 'package:dio/io.dart';

IOHttpClientAdapter httpAdapter = IOHttpClientAdapter(
  validateCertificate: (cert, host, port) {
    return true;
  },
);
