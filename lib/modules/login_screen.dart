import 'package:flutter/material.dart';
import 'package:tumora/modules/profile/profile_screen.dart';
import 'package:tumora/shared/color_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _validatePhoneNumber(String? value) {
    // Check if the input is a numeric value and has exactly 11 digits
    final numericRegex = RegExp(r'^[0-9]{11}$');
    if (!numericRegex.hasMatch(value!)) {
      return 'Please enter exactly 11 numeric digits';
    }
    return null;
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProfileScreen(),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: ColorManager.primary,
                radius: 52,
                child: const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://img.freepik.com/free-vector/bird-colorful-logo-gradient-vector_343694-1365.jpg?size=338&ext=jpg&ga=GA1.1.1141335507.1717804800&semt=sph'),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                  ),
                  validator: _validatePhoneNumber),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: MaterialButton(
                  splashColor: ColorManager.splash,
                  textColor: ColorManager.white,
                  color: ColorManager.primary,
                  height: 30,
                  onPressed: _login,
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
