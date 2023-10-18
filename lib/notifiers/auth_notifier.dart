import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_codium/homepage.dart';
import 'package:login_codium/service/auth_services.dart';

final authNotifierProvider = StateNotifierProvider<AuthNotifier, bool>(
    (ref) => AuthNotifier(ref.watch(authServicesProvider)));

class AuthNotifier extends StateNotifier<bool> {
  final AuthServices _authServices;
  AuthNotifier(this._authServices) : super(false);

  void validate(
      {required String username,
      required String password,
      required BuildContext context}) async {
    if (username == "CODIUM" && password == "CODIUM") {
      state = true;
      await _authServices.validate(username: username, password: password);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
      state = false;
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              "Alert",
              style: TextStyle(color: Colors.red),
            ),
            content: const Text("Please Correct Username and Password"),
            actions: [
              TextButton(
                onPressed: () {
                  state = false;
                  Navigator.pop(context);
                },
                child: const Text(
                  'OK',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  void ToggleButtons() {}
}
