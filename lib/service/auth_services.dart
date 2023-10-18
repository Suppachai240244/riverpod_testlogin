import 'package:flutter_riverpod/flutter_riverpod.dart';

final authServicesProvider = Provider<AuthServices>((ref) => AuthServices());

class AuthServices {
  bool isLoggedIn = false;

  Future<bool> validate(
      {required String username, required String password}) async {
    await Future.delayed(const Duration(seconds: 3), () {
      isLoggedIn = true;
    });
    return isLoggedIn;
  }
}
