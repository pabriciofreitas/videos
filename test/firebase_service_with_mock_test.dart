import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:videos/service/firebase_auth_service.dart';

import 'test/mocks/firebase_auth_mock.mocks.dart'; // arquivo gerado pelo build_runner

void main() {
  late MockFirebaseAuth mockAuth;
  late MockUserCredential mockCredential;
  late MockUser mockUser;
  late FirebaseAuthService authService;

  setUp(() {
    mockAuth = MockFirebaseAuth();
    mockCredential = MockUserCredential();
    mockUser = MockUser();
    authService = FirebaseAuthService(mockAuth); // injetando mock
  });

  const testEmail = 'test@example.com';
  const testPassword = '123456';

  group('createUserWithEmailAndPassword', () {
    test('deve retornar um User ao criar com sucesso', () async {
      when(mockCredential.user).thenReturn(mockUser);
      when(
        mockAuth.createUserWithEmailAndPassword(
          email: testEmail,
          password: testPassword,
        ),
      ).thenAnswer((_) async => mockCredential);

      final result = await authService.createUserWithEmailAndPassword(
        email: testEmail,
        password: testPassword,
      );

      expect(result, mockUser);
      verify(
        mockAuth.createUserWithEmailAndPassword(
          email: testEmail,
          password: testPassword,
        ),
      ).called(1);
    });

    test('deve lançar exceção se o e-mail já estiver em uso', () async {
      when(
        mockAuth.createUserWithEmailAndPassword(
          email: testEmail,
          password: testPassword,
        ),
      ).thenThrow(FirebaseAuthException(code: 'email-already-in-use'));

      expect(
        () async => await authService.createUserWithEmailAndPassword(
          email: testEmail,
          password: testPassword,
        ),
        throwsA(
          predicate(
            (e) =>
                e is Exception &&
                e.toString().contains('This email is already in use.'),
          ),
        ),
      );
    });

    test('deve lançar exceção se a senha for fraca', () async {
      when(
        mockAuth.createUserWithEmailAndPassword(
          email: testEmail,
          password: testPassword,
        ),
      ).thenThrow(FirebaseAuthException(code: 'weak-password'));

      expect(
        () async => await authService.createUserWithEmailAndPassword(
          email: testEmail,
          password: testPassword,
        ),
        throwsA(
          predicate(
            (e) =>
                e is Exception &&
                e.toString().contains('The password is too weak.'),
          ),
        ),
      );
    });

    test(
      'deve lançar exceção genérica para erro desconhecido do FirebaseAuth',
      () async {
        when(
          mockAuth.createUserWithEmailAndPassword(
            email: testEmail,
            password: testPassword,
          ),
        ).thenThrow(
          FirebaseAuthException(code: 'unknown-error', message: 'Unknown'),
        );

        expect(
          () async => await authService.createUserWithEmailAndPassword(
            email: testEmail,
            password: testPassword,
          ),
          throwsA(
            predicate(
              (e) =>
                  e is Exception &&
                  e.toString().contains(
                    'Error creating account, please try again.',
                  ),
            ),
          ),
        );
      },
    );

    test('deve lançar exceção genérica para outros erros', () async {
      when(
        mockAuth.createUserWithEmailAndPassword(
          email: testEmail,
          password: testPassword,
        ),
      ).thenThrow(Exception('Algo deu errado'));

      expect(
        () async => await authService.createUserWithEmailAndPassword(
          email: testEmail,
          password: testPassword,
        ),
        throwsA(
          predicate(
            (e) =>
                e is Exception &&
                e.toString().contains(
                  'Error creating account, please try again.',
                ),
          ),
        ),
      );
    });
  });
}
