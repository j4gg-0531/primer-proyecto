import 'package:flutter/material.dart';
import 'package:mi_primer_app/features/reportes_precio/data/reportes_precio_locales.dart';
import 'package:mi_primer_app/features/reportes_precio/domain/reporte_precio.dart';

void main() => runApp(const ViaJustaApp());

class ViaJustaApp extends StatelessWidget {
  const ViaJustaApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Vía Justa',
        theme: ThemeData(colorSchemeSeed: Colors.teal),
        home: const PantallaReportes(),
      );
}

class PantallaReportes extends StatefulWidget {
  const PantallaReportes({super.key});

  @override
  State<PantallaReportes> createState() => _PantallaReportesState();
}

class _PantallaReportesState extends State<PantallaReportes> {
  // `late final` en el campo: el Future se crea UNA vez. Crearlo dentro de
  // build() lo relanza en cada reconstrucción y hace parpadear el FutureBuilder.
  late final Future<List<ReportePrecio>> _reportes =
      ReportesPrecioLocales().obtenerTodos();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Reportes de precio')),
        body: FutureBuilder<List<ReportePrecio>>(
          future: _reportes,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              // CampoInvalido dice el campo: aquí se ve por qué valió el paso 4.
              return Center(child: Text('No se pudo leer:\n${snapshot.error}'));
            }

            final reportes = snapshot.data ?? const <ReportePrecio>[];
            return ListView.separated(
              itemCount: reportes.length,
              separatorBuilder: (_, _) => const Divider(height: 1),
              itemBuilder: (context, i) {
                final reporte = reportes[i];
                return ListTile(
                  title: Text(reporte.titulo),
                  subtitle: Text(
                    '${reporte.ubicacion.barrio} · ${reporte.monto} ${reporte.moneda}'
                    ' · ${reporte.estado.etiqueta}',
                  ),
                  trailing: reporte.esSospechosoDeSobrecosto
                      ? const Icon(Icons.warning_amber, color: Colors.red)
                      : null,
                );
              },
            );
          },
        ),
      );
}