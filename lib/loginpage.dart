import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_codium/notifiers/auth_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final showPassProvider = StateProvider<bool>((ref) => true);

class LoginPage extends ConsumerWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool showPassState = ref.watch(showPassProvider);
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Image.asset("assets/login.png"),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 55,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F9FD),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF475269).withOpacity(0.3),
                        blurRadius: 5,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.person,
                        size: 27,
                        color: Color(0xFF475269),
                      ),
                      const SizedBox(width: 15),
                      SizedBox(
                        width: 250,
                        child: TextFormField(
                          controller: _usernameController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Username",
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 55,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F9FD),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF475269).withOpacity(0.3),
                        blurRadius: 5,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.lock,
                        size: 27,
                        color: Color(0xFF475269),
                      ),
                      const SizedBox(width: 15),
                      SizedBox(
                        width: 240,
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: showPassState,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Password",
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          ref
                              .read(showPassProvider.notifier)
                              .update((state) => !state);
                        },
                        icon: Icon(
                          showPassState
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: const Color(0xFF475269),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot Password",
                      style: TextStyle(
                        color: Color(0xFF475269),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Consumer(
                  builder: (context, ref, _) {
                    bool isLoading = ref.watch(authNotifierProvider);
                    return isLoading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF475269)),
                            onPressed: () {
                              ref.read(authNotifierProvider.notifier).validate(
                                  username: _usernameController.text,
                                  password: _passwordController.text,
                                  context: context);
                            },
                            child: const Text(
                              'Sign In',
                              style: TextStyle(fontSize: 25),
                            ),
                          );
                  },
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't Have Account? -",
                      style: TextStyle(
                        color: const Color(0xFF475269).withOpacity(0.8),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Color(0xFF475269),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
