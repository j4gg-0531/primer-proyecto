import 'package:mi_primer_app/core/json.dart';

/// En qué punto de su vida está un reporte de precio.
///
/// `sealed` significa dos cosas: nadie fuera de este archivo puede añadir un
/// estado, y el compilador conoce la lista completa. Eso hace que los `switch`
/// puedan ser exhaustivos sin `default`.
sealed class EstadoReporte {
  const EstadoReporte();

  /// El ÚNICO sitio donde un texto del JSON se convierte en un tipo.
  factory EstadoReporte.fromJson(Map<String, dynamic> json) {
    final tipo = leerTexto(json, 'tipo');
    return switch (tipo) {
      'pendiente' => Pendiente(leerEntero(json, 'reportesEnLaZona')),
      'verificado' => Verificado(
          leerDecimal(json, 'promedio'),
          leerDecimal(json, 'desviacion'),
        ),
      'alerta' => Alerta(
          leerDecimal(json, 'sobrecostoPorcentual'),
          leerDecimal(json, 'montoJusto'),
        ),
      'descartado' => Descartado(leerTexto(json, 'motivo')),
      _ => throw CampoInvalido('estado.tipo', 'no es un estado conocido', tipo),
    };
  }

  /// El único sitio donde vuelve a ser texto. Simétrico a fromJson: si añades
  /// un estado arriba y olvidas añadirlo aquí, esto no compila.
  Map<String, dynamic> toJson() => switch (this) {
        Pendiente(:final reportesEnLaZona) => {
            'tipo': 'pendiente',
            'reportesEnLaZona': reportesEnLaZona,
          },
        Verificado(:final promedio, :final desviacion) => {
            'tipo': 'verificado',
            'promedio': promedio,
            'desviacion': desviacion,
          },
        Alerta(:final sobrecostoPorcentual, :final montoJusto) => {
            'tipo': 'alerta',
            'sobrecostoPorcentual': sobrecostoPorcentual,
            'montoJusto': montoJusto,
          },
        Descartado(:final motivo) => {'tipo': 'descartado', 'motivo': motivo},
      };

  /// Regla de negocio: un precio ya verificado o en alerta tiene estadísticas
  /// que no se deben invalidar editando el reporte. Un pendiente o descartado
  /// sí se corrige y se reenvía.
  bool get sePuedeEditar => switch (this) {
        Pendiente() || Descartado() => true,
        Verificado() || Alerta() => false,
      };

  /// Regla de negocio: solo la alerta es sospechosa de sobrecosto.
  bool get esSospechoso => switch (this) {
        Pendiente() || Verificado() || Descartado() => false,
        Alerta() => true,
      };

  /// Texto para la pantalla. Con un solo idioma, aquí está bien y se prueba fácil.
  String get etiqueta => switch (this) {
        Pendiente(:final reportesEnLaZona) =>
          'Pendiente · $reportesEnLaZona reportes en la zona',
        Verificado() => 'Verificado',
        Alerta(:final sobrecostoPorcentual) =>
          'Alerta · +$sobrecostoPorcentual% sobre el promedio',
        Descartado(:final motivo) => 'Descartado: $motivo',
      };
}

final class Pendiente extends EstadoReporte {
  const Pendiente(this.reportesEnLaZona)
      : assert(reportesEnLaZona >= 0, 'la cantidad no puede ser negativa');

  final int reportesEnLaZona;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pendiente && other.reportesEnLaZona == reportesEnLaZona;

  @override
  int get hashCode => Object.hash(runtimeType, reportesEnLaZona);

  @override
  String toString() => 'Pendiente($reportesEnLaZona)';
}

final class Verificado extends EstadoReporte {
  const Verificado(this.promedio, this.desviacion);

  final double promedio;
  final double desviacion;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Verificado &&
          other.promedio == promedio &&
          other.desviacion == desviacion;

  @override
  int get hashCode => Object.hash(runtimeType, promedio, desviacion);

  @override
  String toString() => 'Verificado($promedio, $desviacion)';
}

final class Alerta extends EstadoReporte {
  const Alerta(this.sobrecostoPorcentual, this.montoJusto);

  final double sobrecostoPorcentual;
  final double montoJusto;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Alerta &&
          other.sobrecostoPorcentual == sobrecostoPorcentual &&
          other.montoJusto == montoJusto;

  @override
  int get hashCode =>
      Object.hash(runtimeType, sobrecostoPorcentual, montoJusto);

  @override
  String toString() => 'Alerta($sobrecostoPorcentual, $montoJusto)';
}

final class Descartado extends EstadoReporte {
  // El assert documenta la regla y la caza en depuración. La GARANTÍA es
  // leerTexto, que rechaza la cadena vacía también en producción.
  const Descartado(this.motivo) : assert(motivo != '', 'descartar exige motivo');

  final String motivo;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Descartado && other.motivo == motivo;

  @override
  int get hashCode => Object.hash(runtimeType, motivo);

  @override
  String toString() => 'Descartado($motivo)';
}