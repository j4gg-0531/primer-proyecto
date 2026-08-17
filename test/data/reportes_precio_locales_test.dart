import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_test/flutter_test.dart';
import 'package:mi_primer_app/core/json.dart';
import 'package:mi_primer_app/features/reportes_precio/data/reportes_precio_locales.dart';

const _json = '''
[
  {
    "id": "rep-p-001",
    "titulo": "Carrera de taxi del aeropuerto al centro",
    "descripcion": "Tarifa sin taxímetro, acordada con el conductor.",
    "categoria": "transporte",
    "monto": 28000.0,
    "moneda": "COP",
    "ubicacion": { "latitud": 10.4631, "longitud": -73.2532, "barrio": "Centro" },
    "creadoEn": "2026-08-10T19:05:00Z",
    "estado": { "tipo": "verificado", "promedio": 18000.0, "desviacion": 2500.0 }
  },
  {
    "id": "rep-p-002",
    "titulo": "Arriendo de habitación en Villa Corelca",
    "descripcion": "Habitación amoblada, servicios incluidos.",
    "categoria": "arriendo",
    "monto": 450000.0,
    "moneda": "COP",
    "ubicacion": { "latitud": 10.4487, "longitud": -73.2601, "barrio": "Villa Corelca" },
    "creadoEn": "2026-08-11T04:40:00Z",
    "estado": { "tipo": "pendiente", "reportesEnLaZona": 2 }
  }
]
''';

void main() {
  test('lee la lista completa del archivo', () async {
    final repo = ReportesPrecioLocales(lector: (_) async => _json);
    expect((await repo.obtenerTodos()).length, 2);
  });

  test('busca por id y devuelve null cuando no está', () async {
    final repo = ReportesPrecioLocales(lector: (_) async => _json);

    expect((await repo.obtenerPorId('rep-p-001'))?.titulo, contains('taxi'));
    expect(await repo.obtenerPorId('no-existe'), isNull);
  });

  test('busca por zona: solo los reportes del barrio pedido', () async {
    final repo = ReportesPrecioLocales(lector: (_) async => _json);

    final delCentro = await repo.buscarPorZona('Centro');
    expect(delCentro.length, 1);
    expect(delCentro.single.ubicacion.barrio, 'Centro');

    expect(await repo.buscarPorZona('No existe'), isEmpty);
  });

  test('un archivo que no es una lista se rechaza', () async {
    final repo = ReportesPrecioLocales(lector: (_) async => '{"a": 1}');
    expect(repo.obtenerTodos(), throwsA(isA<CampoInvalido>()));
  });

  test(
    'el asset declarado en pubspec existe y el modelo lo entiende',
    () async {
      // Esta SÍ toca el bundle: es la única que caza "olvidé el pubspec".
      TestWidgetsFlutterBinding.ensureInitialized();

      final repo = ReportesPrecioLocales(lector: rootBundle.loadString);
      expect((await repo.obtenerTodos()).length, greaterThanOrEqualTo(3));
    },
  );
}
