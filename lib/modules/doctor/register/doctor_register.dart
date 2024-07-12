import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tumora/modules/users/layout/layout.dart';
import 'package:tumora/modules/users/login/login_screen.dart';
import 'package:tumora/shared/color_manager.dart';
import 'package:tumora/shared/components.dart';

class DoctorRegisterScreen extends StatefulWidget {
  const DoctorRegisterScreen({super.key});

  @override
  State<DoctorRegisterScreen> createState() => _DoctorRegisterScreenState();
}

class _DoctorRegisterScreenState extends State<DoctorRegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  String? major;
  List majors = [
    'Cardiology ',
    'Neurology ',
    'Oncology ',
    'Pediatrics',
    'Dermatology'
  ];

  String? years;
  List yearsOfExp = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10+',
  ];

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _qualificationsContriller =
      TextEditingController();
  final TextEditingController _nationalIDController = TextEditingController();

  String? _validatePhoneNumber(String? newvalue) {
    // Check if the input is a numeric newvalue and has exactly 11 digits
    final numericRegex = RegExp(r'^[0-9]{11}$');
    if (!numericRegex.hasMatch(newvalue!)) {
      return 'Please enter exactly 11 numeric digits';
    }
    return null;
  }

  void _register() {
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
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 100,
        ),
        child: Form(
          key: _formKey,
          child: BounceInLeft(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Text(
                  textAlign: TextAlign.center,
                  'Welcome Doctor !',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                //! Name !\\
                const Padding(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Text(
                    'Please Provide Us with this informations:',
                    // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: TFF(
                      label: 'First Name',
                      validationMassage: (newvalue) {
                        if (newvalue!.isEmpty) {
                          return 'Enter First Name';
                        }
                        return null;
                      },
                      controller: _firstNameController,
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TFF(
                      validationMassage: (newvalue) {
                        if (newvalue!.isEmpty) {
                          return 'Enter Last Name';
                        }
                        return null;
                      },
                      label: 'Last Name',
                      controller: _lastNameController,
                    ))
                  ],
                ),
                const SizedBox(height: 10),
                //! Specialization !\\
                // Container(
                //   decoration: BoxDecoration(
                //        color: Colors.grey,
                //       border: Border.all(color: Colors.grey, width: 1.5),
                //       borderRadius:
                //           const BorderRadius.all(Radius.circular(15))),
                //   child: DropdownButton<String?>(
                //       isExpanded: true,
                //       padding: const EdgeInsets.symmetric(horizontal: 10),
                //       underline: const SizedBox(),
                //       hint: const Text('Specialization'),
                //       borderRadius: const BorderRadius.all(Radius.circular(10)),
                //       value: major,
                //       onChanged: (newvalue) {
                //         setState(() {
                //           major = newvalue;
                //         });
                //       },
                //       //List Items
                //       items: majors.map(
                //         (e) {
                //           return DropdownMenuItem(
                //             value: e.toString(),
                //             child: Text(e),
                //           );
                //         },
                //       ).toList()),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                //! Phone Number !\\

                const SizedBox(
                  height: 10,
                ),
                TFF(
                    label: 'Phone Number',
                    keyboardType: TextInputType.number,
                    controller: _phoneController,
                    validationMassage:
                        _validatePhoneNumber), //احتمال كبير متشتغلش
                const SizedBox(
                  height: 10,
                ),
                //! E-mail !\\
                TFF(
                  label: 'E-mail',
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  validationMassage: (newvalue) {
                    if (newvalue!.isEmpty) {
                      return 'enter a valid G-mail';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                //! Password !\\
                TFF(
                  label: 'Password',
                  controller: _passwordController,
                  isObsecure: true,
                  validationMassage: (newvalue) {
                    if (newvalue!.isEmpty) {
                      return 'A Valid Password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                // //! adress !\\
                // TFF(
                //   controller: _adressController,
                //   label: 'Adress',
                //   validationMassage: (newvalue) {
                //     if (newvalue!.isEmpty) {
                //       return 'Enter A valid adress';
                //     }
                //     return null;
                //   },
                // ),
                // const SizedBox(height: 10),
                // //! National ID !\\
                // TFF(
                //   keyboardType: TextInputType.number,
                //   label: 'Nationality ID',
                //   controller: _nationalIDController,
                //   validationMassage: (newvalue) {
                //     if (newvalue!.isEmpty) {
                //       return 'Enter First Name';
                //     }
                //     return null;
                //   },
                // ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: MyDropDown(
                        hint: 'Specialization',
                        initianlValue: major,
                        valuesList: majors,
                        doSetStateHere: (newValue) {
                          setState(() {
                            major = newValue;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: MyDropDown(
                        hint: 'Years',
                        initianlValue: years,
                        valuesList: yearsOfExp,
                        doSetStateHere: (newValue) {
                          setState(() {
                            years = newValue;
                          });
                        },
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(height: 1),
                    hintText: 'Tell us a bit about your career',
                  ),
                  maxLines: 5,
                  controller: _qualificationsContriller,
                ),
                const SizedBox(height: 20),

                //todo add gender select here
                //! Button !\\
                DefultButton(onpressed: _register, text: 'Register'),
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
                          navigateTo(context, const HomeScreen());
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
