import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:mi_primer_app/core/json.dart';
import 'package:mi_primer_app/features/reportes_precio/domain/reporte_precio.dart';
import 'package:mi_primer_app/features/reportes_precio/domain/reportes_repository.dart';

/// Cómo se lee un archivo de texto. Se inyecta para poder probar sin assets.
typedef LectorDeAssets = Future<String> Function(String ruta);

class ReportesPrecioLocales implements ReportesRepository {
  /// El lector entra por el constructor. En producción es `rootBundle`; en las
  /// pruebas, una función que devuelve una cadena. Esa costura de dos líneas
  /// es lo que hace que las pruebas no necesiten ni Flutter ni el bundle.
  ReportesPrecioLocales({
    LectorDeAssets? lector,
    this.ruta = 'assets/data/reportes_precio.json',
  }) : _lector = lector ?? rootBundle.loadString;

  final LectorDeAssets _lector;
  final String ruta;

  /// El archivo no cambia mientras la app corre: leerlo y parsearlo en cada
  /// pantalla sería tirar trabajo a la basura.
  List<ReportePrecio>? _cache;

  @override
  Future<List<ReportePrecio>> obtenerTodos() async {
    final guardado = _cache;
    if (guardado != null) return guardado;

    final crudo = await _lector(ruta);
    final decodificado = jsonDecode(crudo);

    if (decodificado is! List) {
      throw const CampoInvalido(
        '(raíz)',
        'el archivo debe contener una lista',
        null,
      );
    }

    return _cache = decodificado
        .map((e) => ReportePrecio.fromJson(e as Map<String, dynamic>))
        .toList(growable: false);
  }

  @override
  Future<ReportePrecio?> obtenerPorId(String id) async {
    for (final reporte in await obtenerTodos()) {
      if (reporte.id == id) return reporte;
    }
    return null;
  }

  @override
  Future<List<ReportePrecio>> buscarPorZona(String barrio) async {
    return (await obtenerTodos())
        .where((r) => r.ubicacion.barrio == barrio)
        .toList(growable: false);
  }
}
