import 'package:flutter_test/flutter_test.dart';
import 'package:mi_primer_app/main.dart';

void main() {
  testWidgets('la pantalla lista los reportes del asset', (tester) async {
    await tester.pumpWidget(const ViaJustaApp());
    await tester.pumpAndSettle();

    expect(find.text('Reportes de precio'), findsOneWidget);
    expect(find.textContaining('taxi'), findsOneWidget);
  });
}
