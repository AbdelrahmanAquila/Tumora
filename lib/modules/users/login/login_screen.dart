import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tumora/modules/doctor/login/doctor_login.dart';
import 'package:tumora/modules/users/layout/layout.dart';
import 'package:tumora/modules/users/register/register_screen.dart';
import 'package:tumora/shared/color_manager.dart';
import 'package:tumora/shared/components.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool startAnimation = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();

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
            builder: (context) => const HomeScreen(),
          ));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        setState(() {
          startAnimation = true;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(25),
        child: FloatingActionButton(
          onPressed: () {
            navigateTo(context, const DoctorLoginScreen());
          },
          child: const Icon(
            Icons.medical_information,
            color: Colors.white,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: FadeInDown(
            animate: startAnimation,
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
                TFF(
                    label: 'Phone Number',
                    keyboardType: TextInputType.number,
                    controller: _phoneController,
                    validationMassage: _validatePhoneNumber),
                const SizedBox(
                  height: 10,
                ),
                TFF(
                  label: 'Password',
                  controller: _passwordController,
                  isObsecure: true,
                  validationMassage: (value) {
                    {
                      if (value!.isEmpty) {
                        return 'Please enter a valid password';
                      }
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                DefultButton(onpressed: _login, text: 'Login'),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Not a Member?'),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterScreen(),
                              ));
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(color: ColorManager.primary),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
