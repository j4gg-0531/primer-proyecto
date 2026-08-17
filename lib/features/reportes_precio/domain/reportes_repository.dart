import 'package:mi_primer_app/features/reportes_precio/domain/reporte_precio.dart';

/// Lo que la aplicación necesita saber de los reportes de precio.
///
/// `abstract interface class` = solo contrato: nadie puede heredar de aquí,
/// solo implementarlo. Es la declaración de intenciones más explícita que hay.
abstract interface class ReportesRepository {
  Future<List<ReportePrecio>> obtenerTodos();

  Future<ReportePrecio?> obtenerPorId(String id);

  /// Los precios reportados en un barrio: la base del promedio por zona.
  Future<List<ReportePrecio>> buscarPorZona(String barrio);
}
