import 'package:flutter/material.dart';
import 'package:tasky_app/data/firebase/firebase_auth.dart';
import 'package:tasky_app/screen/auth/home/home_screen.dart';
import 'package:tasky_app/screen/auth/register_screen.dart';
import 'package:tasky_app/screen/auth/widget/material_button_widgwt.dart';
import 'package:tasky_app/screen/auth/widget/text_form_field.dart';
import 'package:tasky_app/screen/auth/widget/text_rich_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  static String route = 'loginscreen';

  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 24),
                        const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff24252C),
                          ),
                        ),
                        const SizedBox(height: 55),
                        const Text(
                          'Username',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff24252C),
                          ),
                        ),
                        const SizedBox(height: 7),
                        TextFormFieldWidget(
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'please enter username';
                            }
                            final regex = RegExp(
                                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

                            if (!regex.hasMatch(text)) {
                              return 'Enter valid username or email';
                            }
                            return null;
                          },
                          controller: username,
                          hint: 'Enter username',
                        ),
                        const SizedBox(height: 25),
                        const Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff24252C),
                          ),
                        ),
                        const SizedBox(height: 7),
                        TextFormFieldWidget(
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'please enter password';
                            }
                            return null;
                          },
                          controller: password,
                          hint: 'Enter password',
                        ),
                        const SizedBox(height: 40),
                        MaterialButtonWidget(
                          title: "Login",
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              bool success = await FirebaseAuth.login(
                                username: username.text,
                                password: password.text,
                              );

                              if (success) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomeScreen(),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Login failed. Try again."),
                                  ),
                                );
                              }
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: TextRichWidget(
                  title: 'Don’t have an account? ',
                  subTitle: 'Register',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
