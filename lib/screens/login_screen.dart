import 'package:evently/app_theme.dart';
import 'package:evently/screens/register_screen.dart';
import 'package:evently/widgets/default_elevated_button.dart';
import 'package:evently/widgets/default_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Spacer(),
                Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 32,
                    fit: .scaleDown,
                  ),
                ),
                Spacer(),
                Text('Login to your account', style: textTheme.headlineMedium),
                Spacer(),
                DefaultTextFormField(
                  hintText: 'Enter your email',
                  prefixIconImageName: 'email',
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.length < 5) {
                      return 'invalid email';
                    }
                    return null;
                  },
                ),
                Spacer(),
                DefaultTextFormField(
                  hintText: 'Enter your password',
                  prefixIconImageName: 'password',
                  isPassword: true,
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.length < 8) {
                      return 'invalid password';
                    }
                    return null;
                  },
                ),

                Align(
                  alignment: .topRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text('Forget Password? '),
                  ),
                ),
                Spacer(),
                DefaultElevatedButton(label: 'Login', onPressed: login),
                Spacer(),
                Row(
                  children: [
                    Text(
                      'Don’t have an account ? ',
                      style: textTheme.titleSmall,
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.of(
                          context,
                        ).pushReplacementNamed(RegisterScreen.routeName);
                      },
                      child: Text('Register'),
                    ),
                  ],
                ),
                Spacer(),

                Row(
                  children: [
                    const Expanded(child: Divider(color: AppTheme.grey)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'Or',
                        style: textTheme.titleMedium?.copyWith(
                          color: AppTheme.primaryLight,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Expanded(child: Divider(color: AppTheme.grey)),
                  ],
                ),
                Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      backgroundColor: AppTheme.white,
                      side: const BorderSide(color: AppTheme.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/google.png'),
                        const SizedBox(width: 12),
                        Text(
                          'Login with Google',
                          style: textTheme.bodyMedium?.copyWith(
                            color: AppTheme.primaryLight,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Spacer(flex: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    if (formKey.currentState!.validate()) {}
  }
}
