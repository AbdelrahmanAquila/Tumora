import 'package:flutter/material.dart';
import 'package:tumora/modules/login/login_screen.dart';
import 'package:tumora/shared/color_manager.dart';
import 'package:tumora/shared/components.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _adressController = TextEditingController();
  final TextEditingController _nationalIDController = TextEditingController();

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
            builder: (context) => const LoginScreen()
            //sdd screen nav
            ,
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 15.0, right: 15, bottom: 15, top: 60),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Lets get this account done, shall we?'),
                const SizedBox(
                  height: 20,
                ),
                //! Name !\\
                Row(
                  children: [
                    Expanded(
                        child: TFF(
                      label: 'First Name',
                      validationMassage: 'Enter First name',
                      controller: _firstNameController,
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TFF(
                      validationMassage: 'Enter Last name',
                      label: 'Last Name',
                      controller: _lastNameController,
                    ))
                  ],
                ),
                const SizedBox(height: 20),
                //! Phone Number !\\
                TFF(
                    label: 'Phone Number',
                    keyboardType: TextInputType.number,
                    controller: _phoneController,
                    validationMassage:
                        _validatePhoneNumber.toString()), //احتمال كبير متشتغلش
                const SizedBox(
                  height: 10,
                ),
                //! E-mail !\\
                TFF(
                  label: 'E-mail',
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  validationMassage: 'Enter a Valid Email',
                ),
                const SizedBox(height: 10),
                //! Password !\\
                TFF(
                  label: 'Password',
                  controller: _passwordController,
                  isObsecure: true,
                  validationMassage: 'Password isn\'t Correct',
                ),
                const SizedBox(height: 20),
                //! adress !\\
                TFF(
                  controller: _adressController,
                  label: 'Adress',
                  validationMassage: 'Enter Your Adress',
                ),
                const SizedBox(height: 10),
                //! National ID !\\
                TFF(
                  keyboardType: TextInputType.number,
                  label: 'Nationality ID',
                  controller: _nationalIDController,
                  validationMassage: 'Enter your nationality ID',
                ),
                const SizedBox(height: 20),

                //todo add gender select here
                //! Button !\\
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
                      'Sign Up',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //! Text Button !\\
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('alredy have an account?'),
                    TextButton(
                        onPressed: () {
                          navigateTo(context, const LoginScreen());
                        },
                        child: Text(
                          'Sign in',
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
