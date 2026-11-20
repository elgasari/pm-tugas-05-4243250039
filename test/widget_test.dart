import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:pm_tugas_05_4243250039/main.dart';

void main() {
  testWidgets('Menekan tombol favorit mengubah ikon hati', (tester) async {
    await tester.pumpWidget(const MenuUmkmMedanApp());

    expect(find.byIcon(Icons.favorite_border), findsWidgets);
    await tester.ensureVisible(find.byIcon(Icons.favorite_border).first);
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.favorite_border).first);
    await tester.pump();

    expect(find.byIcon(Icons.favorite), findsOneWidget);
  });
}