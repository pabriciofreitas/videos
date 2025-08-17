import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:videos/repository/sign_up/i_sign_up_repository.dart';

class SignUpViewModel extends ChangeNotifier {
  final ISignUpRepository _signUpRepository;

  final emailTextEditController = TextEditingController();
  final passwordTextEditController = TextEditingController();
  final passwordConfirmTextEditController = TextEditingController();
  final nameTextEditController = TextEditingController();

  File? profileImage;
  void setProfileImage(File image) {
    profileImage = image;
    notifyListeners();
  }

  bool isLoading = false;
  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  SignUpViewModel(this._signUpRepository);
  User? user;
  Future<void> createUserWithEmailAndPassword() async {
    try {
      setLoading(true);
      user = await _signUpRepository.createUserWithEmailAndPassword(
        email: emailTextEditController.text.toLowerCase().trim(),
        password: passwordTextEditController.text.trim(),
      );
    } catch (e) {
      rethrow;
    } finally {
      setLoading(false);
    }
  }

  Future<void> createUserWithGoogle() async {
    try {
      setLoading(true);
      user = await _signUpRepository.createUserWithGoogle();
    } catch (e) {
      rethrow;
    } finally {
      setLoading(false);
    }
  }
}
