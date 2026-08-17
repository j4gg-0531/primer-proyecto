import 'package:mi_primer_app/core/comparaciones.dart';
import 'package:mi_primer_app/core/json.dart';
import 'package:mi_primer_app/features/reportes_precio/domain/estado_reporte.dart';
import 'package:mi_primer_app/features/reportes_precio/domain/ubicacion.dart';

/// Cuánto pagó un usuario por algo, en un lugar y momento dados.
///
/// Es una **entidad**: tiene identidad propia. Dos reportes con el mismo texto
/// y monto son dos reportes distintos si tienen `id` distinto.
class ReportePrecio {
  const ReportePrecio({
    required this.id,
    required this.titulo,
    required this.categoria,
    required this.monto,
    required this.moneda,
    required this.ubicacion,
    required this.creadoEn,
    required this.estado,
    this.descripcion,
    this.fotos = const <String>[],
  });

  factory ReportePrecio.fromJson(Map<String, dynamic> json) => ReportePrecio(
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

  final String id;
  final String titulo;
  final String? descripcion;
  final String categoria;
  final double monto;
  final String moneda;
  final Ubicacion ubicacion;
  final DateTime creadoEn;
  final EstadoReporte estado;
  final List<String> fotos;

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

  // ── Reglas de negocio ───────────────────────────────────────────────────
  // Viven aquí, no en el widget: un widget no se puede probar en 3 ms.

  bool get tieneEvidencia => fotos.isNotEmpty;

  /// Un precio por encima de 2 desviaciones estándar es posible sobrecosto.
  bool get esSospechosoDeSobrecosto => estado.esSospechoso;

  bool get sePuedeEditar => estado.sePuedeEditar;

  /// El reloj entra como parámetro: con `DateTime.now()` dentro, esta regla
  /// no se podría probar sin esperar días reales.
  Duration antiguedad(DateTime ahora) => ahora.difference(creadoEn);

  /// Un precio deja de ser referencia para la zona pasados 90 días.
  bool estaVencido(DateTime ahora) =>
      antiguedad(ahora) > const Duration(days: 90);

  // ── Copia ───────────────────────────────────────────────────────────────

  ReportePrecio copyWith({
    String? titulo,
    String? descripcion,
    String? categoria,
    double? monto,
    String? moneda,
    Ubicacion? ubicacion,
    EstadoReporte? estado,
    List<String>? fotos,
  }) =>
      ReportePrecio(
        id: id,
        titulo: titulo ?? this.titulo,
        descripcion: descripcion ?? this.descripcion,
        categoria: categoria ?? this.categoria,
        monto: monto ?? this.monto,
        moneda: moneda ?? this.moneda,
        ubicacion: ubicacion ?? this.ubicacion,
        creadoEn: creadoEn,
        estado: estado ?? this.estado,
        fotos: fotos ?? this.fotos,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReportePrecio &&
          other.id == id &&
          other.titulo == titulo &&
          other.descripcion == descripcion &&
          other.categoria == categoria &&
          other.monto == monto &&
          other.moneda == moneda &&
          other.ubicacion == ubicacion &&
          other.creadoEn == creadoEn &&
          other.estado == estado &&
          listasIguales(other.fotos, fotos);

  @override
  int get hashCode => Object.hash(
        id,
        titulo,
        descripcion,
        categoria,
        monto,
        moneda,
        ubicacion,
        creadoEn,
        estado,
        Object.hashAll(fotos),
      );

  @override
  String toString() =>
      'ReportePrecio($id, $titulo, $monto $moneda, ${estado.etiqueta})';
}