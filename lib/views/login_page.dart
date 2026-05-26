import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:post_share/utils/app_snackbar.dart';
import 'package:post_share/utils/myTextField.dart';
import 'package:post_share/utils/submit_buttton.dart';
import 'package:post_share/viewmodels/login_viewmodel.dart';
import 'package:post_share/views/home_page.dart';
import 'package:post_share/views/main_screen.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});

  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginProvider);

    ref.listen<AsyncValue<void>>(loginProvider, (previous, next) {
      next.whenOrNull(
        data: (data) {
          AppSnackbar.show(
            context: context,
            message: "Login successful",
            duration: Duration(seconds: 4),
            color: Colors.green,
          );

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (builder) => MainScreen()),
          );
        },
      );
    });
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            //key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(Icons.lock_person, size: 80, color: Colors.blue),
                const SizedBox(height: 16),
                const Text(
                  'Welcome Back',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 32),

                // Email or Username Field
                MyTextField(
                  controller: _usernameController,
                  labelText: "Email or username",
                  icon: Icon(Icons.person),
                  validatorMessage: "please enter email or username",
                ),
                const SizedBox(height: 16),

                // Password Field
                MyTextField(
                  controller: _passwordController,
                  labelText: "Password",
                  icon: Icon(Icons.key),
                  validatorMessage: "password field cannot be empty",
                ),
                const SizedBox(height: 24),
                if (loginState.isLoading)
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: const CircularProgressIndicator(),
                  ),
                // Login Button
                SubmitButtton(
                  label: "Login",
                  onPressed: loginState.isLoading
                      ? null
                      : () {
                          ref
                              .read(loginProvider.notifier)
                              .login(
                                _usernameController.text,
                                _passwordController.text,
                              );
                        },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
