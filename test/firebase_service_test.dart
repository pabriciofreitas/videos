import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:videos/service/firebase_auth_service.dart';

void main() async {
  await Firebase.initializeApp();
  setUpAll(() async {
    // Inicializa o Firebase — use seu firebase_options.dart se tiver configurado
    await Firebase.initializeApp();
  });

  group('FirebaseAuthService (real)', () {
    final service = FirebaseAuthService.instance;

    const testEmail = 'test@example.com';
    const testPassword = 'StrongPassword123!';

    test('cria usuário com sucesso', () async {
      final user = await service.createUserWithEmailAndPassword(
        email: testEmail,
        password: testPassword,
      );

      expect(user, isA<User>());
      expect(user?.email, testEmail);

      // limpa o usuário criado após o teste
      await user?.delete();
    });

    test('lança exceção se email for inválido', () async {
      expect(
        () async => await service.createUserWithEmailAndPassword(
          email: 'email_invalido',
          password: testPassword,
        ),
        throwsA(
          predicate(
            (e) =>
                e is Exception &&
                e.toString().contains('Invalid email address.'),
          ),
        ),
      );
    });
  });
}
