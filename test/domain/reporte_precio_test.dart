import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mi_primer_app/core/json.dart';
import 'package:mi_primer_app/features/reportes_precio/domain/estado_reporte.dart';
import 'package:mi_primer_app/features/reportes_precio/domain/reporte_precio.dart';
import 'package:mi_primer_app/features/reportes_precio/domain/ubicacion.dart';

ReportePrecio ejemplo({EstadoReporte? estado, List<String>? fotos}) =>
    ReportePrecio(
      id: 'rep-p-001',
      titulo: 'Carrera de taxi del aeropuerto al centro',
      descripcion: 'Tarifa sin taxímetro, acordada con el conductor.',
      categoria: 'transporte',
      monto: 28000.0,
      moneda: 'COP',
      ubicacion: const Ubicacion(
        latitud: 10.4631,
        longitud: -73.2532,
        barrio: 'Centro',
      ),
      creadoEn: DateTime.utc(2026, 8, 10, 19, 5),
      estado: estado ?? const Verificado(18000.0, 2500.0),
      fotos: fotos ?? const <String>[],
    );

void main() {
  group('serialización', () {
    test('un reporte sobrevive la ida y vuelta a JSON sin perder nada', () {
      final original = ejemplo(
        estado: const Alerta(34.5, 108000.0),
        fotos: const ['https://ejemplo.co/f/1.jpg'],
      );

      final texto = jsonEncode(original.toJson());
      final vuelta = ReportePrecio.fromJson(
        jsonDecode(texto) as Map<String, dynamic>,
      );

      expect(vuelta, equals(original));
    });

    test('un reporte sin la clave fotos se lee con la lista vacía', () {
      final json = ejemplo().toJson()..remove('fotos');
      expect(ReportePrecio.fromJson(json).fotos, isEmpty);
    });

    test('un reporte sin título dice QUÉ campo falló, no solo que falló', () {
      final json = ejemplo().toJson()..remove('titulo');

      expect(
        () => ReportePrecio.fromJson(json),
        throwsA(isA<CampoInvalido>().having((e) => e.campo, 'campo', 'titulo')),
      );
    });

    test('una fecha que no es ISO 8601 se rechaza', () {
      final json = ejemplo().toJson()..['creadoEn'] = '10 de agosto';
      expect(() => ReportePrecio.fromJson(json), throwsA(isA<CampoInvalido>()));
    });

    test('la hora se conserva en UTC y no se corre cinco horas', () {
      final json = ejemplo().toJson();
      expect(json['creadoEn'], '2026-08-10T19:05:00.000Z');
    });
  });

  group('igualdad', () {
    test('dos reportes con los mismos datos son iguales', () {
      expect(ejemplo(), equals(ejemplo()));
    });

    test('dos reportes con los mismos datos comparten hashCode', () {
      expect(ejemplo().hashCode, equals(ejemplo().hashCode));
      expect({ejemplo(), ejemplo()}.length, 1);
    });

    test('dos reportes con monto distinto NO son iguales', () {
      expect(ejemplo(), isNot(equals(ejemplo().copyWith(monto: 9999.0))));
    });

    test('copyWith cambia solo lo que se le pasa', () {
      final original = ejemplo();
      final copia = original.copyWith(titulo: 'Otro título');

      expect(copia.titulo, 'Otro título');
      expect(copia.id, original.id);
      expect(copia.creadoEn, original.creadoEn);
    });
  });

  group('reglas de negocio', () {
    test('un precio en alerta de sobrecosto no se puede editar', () {
      expect(
        ejemplo(estado: const Alerta(34.5, 108000.0)).sePuedeEditar,
        isFalse,
      );
    });

    test('un precio en alerta es sospechoso de sobrecosto', () {
      expect(
        ejemplo(estado: const Alerta(34.5, 108000.0)).esSospechosoDeSobrecosto,
        isTrue,
      );
    });

    test('un reporte de hace 120 días está vencido', () {
      final ahora = DateTime.utc(2026, 12, 8);
      expect(ejemplo().estaVencido(ahora), isTrue);
    });

    test('la etiqueta de un descarte incluye el motivo', () {
      expect(
        const Descartado('monto sospechoso sin recibo').etiqueta,
        contains('monto sospechoso'),
      );
    });
  });
}
