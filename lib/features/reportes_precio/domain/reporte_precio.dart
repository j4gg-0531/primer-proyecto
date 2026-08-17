import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mi_primer_app/core/json.dart';
import 'package:mi_primer_app/features/reportes_precio/domain/estado_reporte.dart';
import 'package:mi_primer_app/features/reportes_precio/domain/ubicacion.dart';

part 'reporte_precio.freezed.dart';

@freezed
abstract class ReportePrecio with _$ReportePrecio {
  const factory ReportePrecio({
    required String id,
    required String titulo,
    String? descripcion,
    required String categoria,
    required double monto,
    required String moneda,
    required Ubicacion ubicacion,
    required DateTime creadoEn,
    required EstadoReporte estado,
    @Default(<String>[]) List<String> fotos,
  }) = _ReportePrecio;

  const ReportePrecio._();

  // ── Serialización defensiva ─────────────────────────────────────────────
  // `fromJson` como static y `toJson` como extensión: no son miembros de la
  // clase, así que freezed no genera delegados a json_serializable y la
  // serialización sigue siendo 100 % nuestra (mensajes CampoInvalido).
  static ReportePrecio fromJson(Map<String, dynamic> json) => ReportePrecio(
    id: leerTexto(json, 'id'),
    titulo: leerTexto(json, 'titulo'),
    descripcion: leerTextoOpcional(json, 'descripcion'),
    categoria: leerTexto(json, 'categoria'),
    monto: leerDecimal(json, 'monto'),
    moneda: leerTexto(json, 'moneda'),
    ubicacion: Ubicacion.fromJson(leerMapa(json, 'ubicacion')),
    creadoEn: leerFecha(json, 'creadoEn'),
    estado: EstadoReporte.fromJson(leerMapa(json, 'estado')),
    fotos: leerTextos(json, 'fotos'),
  );

  // ── Reglas de negocio ───────────────────────────────────────────────────
  // freezed genera ==, hashCode, toString y copyWith; las decisiones son tuyas.

  bool get tieneEvidencia => fotos.isNotEmpty;

  bool get esSospechosoDeSobrecosto => estado.esSospechoso;

  bool get sePuedeEditar => estado.sePuedeEditar;

  Duration antiguedad(DateTime ahora) => ahora.difference(creadoEn);

  bool estaVencido(DateTime ahora) =>
      antiguedad(ahora) > const Duration(days: 90);
}

extension ReportePrecioJson on ReportePrecio {
  Map<String, dynamic> toJson() => {
    'id': id,
    'titulo': titulo,
    'descripcion': descripcion,
    'categoria': categoria,
    'monto': monto,
    'moneda': moneda,
    'ubicacion': ubicacion.toJson(),
    'creadoEn': creadoEn.toUtc().toIso8601String(),
    'estado': estado.toJson(),
    'fotos': fotos,
  };
}
