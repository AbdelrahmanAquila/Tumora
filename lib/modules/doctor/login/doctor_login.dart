import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tumora/modules/doctor/layout/doctor_layout.dart';
import 'package:tumora/modules/doctor/register/doctor_register.dart';
import 'package:tumora/shared/color_manager.dart';
import 'package:tumora/shared/components.dart';

class DoctorLoginScreen extends StatefulWidget {
  const DoctorLoginScreen({super.key});

  @override
  DoctorLoginScreenState createState() => DoctorLoginScreenState();
}

class DoctorLoginScreenState extends State<DoctorLoginScreen> {
  bool startAnimation = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  String? _validatePhoneNumber(String? value) {
    // Check if the input is a numeric value and has exactly 11 digits
    final numericRegex = RegExp(r'^[0-9]{11}$');
    if (!numericRegex.hasMatch(value!)) {
      return 'Please enter exactly 11 numeric digits';
    }
    return null;
  }

  // Future<void> _login() async {
  //   String email = _emailController.text;
  //   String password = _passwordController.text;

  //   try {
  //     Response response = await _dio.post(
  //       'http://localhost:3000/doctors/login',
  //       data: {
  //         'email': email,
  //         'password': password,
  //       },
  //     );
  //     print(response.data);
  //     // Handle successful login
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       print('Error response: ${e.response?.data}');
  //       print('Status code: ${e.response?.statusCode}');
  //     } else {
  //       print('Error message: ${e.message}');
  //     }
  //     // Handle login error
  //   }
  // }

  void _login() {
    if (_formKey.currentState!.validate()) {
      _validatePhoneNumber;
      navigateTo(context, const DoctorHomeScreen());
    } else {
      return;
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
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.all(25),
      //   child: FloatingActionButton(
      //     onPressed: () {},
      //     child: const Icon(
      //       Icons.medical_information,
      //       color: Colors.white,
      //     ),
      //   ),
      // ),
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
                  label: 'email',
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  validationMassage: (value) {
                    {
                      if (value!.isEmpty) {
                        return 'Please enter a valid E-mail';
                      }
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TFF(
                  label: 'Password',
                  controller: _passwordController,
                  isObsecure: false,
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
                                builder: (context) =>
                                    const DoctorRegisterScreen(),
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
