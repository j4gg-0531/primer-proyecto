# Vía Justa

Verificación colaborativa de precios para migrantes, refugiados, estudiantes
de intercambio y trabajadores temporales que llegan a un lugar desconocido:
los usuarios reportan cuánto pagaron y el sistema calcula promedios por zona
para alertar posibles sobrecostos (> 2 desviaciones estándar).

## El dominio

- `ReportePrecio` — entidad principal. Identidad: `id`. Campos: titulo,
  descripcion (opcional), categoria, monto, moneda, ubicacion, creadoEn (UTC),
  estado, fotos (lista opcional).
- `Ubicacion` — objeto de valor: latitud, longitud, barrio.
- `EstadoReporte` — sellada: Pendiente · Verificado · Alerta · Descartado.
  Cada estado lleva solo sus datos: `reportesEnLaZona`, `promedio`/`desviacion`,
  `sobrecostoPorcentual`/`montoJusto`, `motivo`.

Reglas de negocio: `sePuedeEditar` (Pendiente/Descartado sí), `esSospechosoDeSobrecosto`
(solo Alerta), `estaVencido` (> 90 días, los precios caducan).

**Decisión freezed**: igualdad, `hashCode`, `toString` y `copyWith` generados
con freezed 3.2.5; la serialización se escribió a mano (`fromJson` como `static`
y `toJson` como extensión) porque json_serializable pierde los mensajes
`CampoInvalido` que nombran el campo fallido y escribe los objetos anidados en
crudo. Las 19 pruebas pasan con la versión generada sin tocarlas.

## Cómo correrlo

    flutter pub get
    flutter test
    flutter run

## Arquitectura

- `lib/core/` — lectores defensivos de JSON (`CampoInvalido`) y comparación de listas.
- `lib/features/reportes_precio/domain/` — modelo puro, sin imports de Flutter.
- `lib/features/reportes_precio/data/` — `ReportesPrecioLocales`: lee el JSON de
  `assets/data/reportes_precio.json` con lector inyectado (mañana: Firestore,
  misma interfaz).
- `test/` — 19 pruebas: serialización (ida y vuelta), igualdad, reglas de
  negocio, repositorio con el asset real.
