import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mi_primer_app/core/json.dart';

part 'estado_reporte.freezed.dart';

@Freezed(unionKey: 'tipo', unionValueCase: FreezedUnionCase.snake)
sealed class EstadoReporte with _$EstadoReporte {
  const factory EstadoReporte.pendiente(
    @Assert('reportesEnLaZona >= 0', 'la cantidad no puede ser negativa')
    int reportesEnLaZona,
  ) = Pendiente;

  const factory EstadoReporte.verificado(double promedio, double desviacion) =
      Verificado;

  const factory EstadoReporte.alerta(
    double sobrecostoPorcentual,
    double montoJusto,
  ) = Alerta;

  const factory EstadoReporte.descartado(
    @Assert('motivo != ""', 'descartar exige motivo') String motivo,
  ) = Descartado;

  /// Sin este constructor privado, freezed NO deja añadir métodos propios.
  const EstadoReporte._();

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

  bool get sePuedeEditar => switch (this) {
    Pendiente() || Descartado() => true,
    Verificado() || Alerta() => false,
  };

  bool get esSospechoso => switch (this) {
    Pendiente() || Verificado() || Descartado() => false,
    Alerta() => true,
  };

  String get etiqueta => switch (this) {
    Pendiente(:final reportesEnLaZona) =>
      'Pendiente · $reportesEnLaZona reportes en la zona',
    Verificado() => 'Verificado',
    Alerta(:final sobrecostoPorcentual) =>
      'Alerta · +$sobrecostoPorcentual% sobre el promedio',
    Descartado(:final motivo) => 'Descartado: $motivo',
  };
}
