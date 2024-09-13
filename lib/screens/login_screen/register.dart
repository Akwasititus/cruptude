import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constants/utils.dart';

import '../APIs/post_functions.dart';
import 'login_decoration/input_deco_design.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isLoading = false;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  //TextController to read text entered in text field
  final TextEditingController _password = TextEditingController();
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _referalCode = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _userName.dispose();
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    _referalCode.dispose();
  }

  // make passcode obscured
  bool isObscuredPassword = true;
  bool value = true;
  bool isChecked = true;
  void _togglePasswordStatusNewPassword() {
    setState(() {
      isObscuredPassword = !isObscuredPassword;
    });
  }

  bool isObscuredConfirmPassword = true;
  void _togglePasswordStatusConfirmPassword() {
    setState(() {
      isObscuredConfirmPassword = !isObscuredConfirmPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //the logo
                    const SizedBox(
                      height: 25,
                    ),
                    Image.asset(
                      'images/splash.png',
                      height: 150,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    //this column holds all the content excluding the button
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: deviceSize.width * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Create Account', style: AllStyle.text11),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text('Already have account?',
                                  style: AllStyle.text12),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  //Getx Navigation
                                  Get.offNamed('/login');
                                },
                                child: Text('Sign in!', style: AllStyle.text1),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Form(
                            key: _formkey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('User Name*', style: AllStyle.text6),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  controller: _userName,
                                  validator: (e) {
                                    if (_userName.text.isEmpty) {
                                      return "Please enter User name";
                                    } else {
                                      return null;
                                    }
                                  },
                                  style: RegisterStyles.subBody1,
                                  keyboardType: TextInputType.name,
                                  decoration: buildInputDecoration("Johnsa"),
                                ), //userName
                                const SizedBox(
                                  height: 10,
                                ),
                                Text('Email*', style: AllStyle.text6),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: _email,
                                  validator: (e) {
                                    if (_email.text.isEmpty) {
                                      return "Please enter email";
                                    } else if (!_email.text.contains("@") ||
                                        !_email.text.contains(".com")) {
                                      return "Please enter a valid email address";
                                    } else {
                                      return null;
                                    }
                                  },
                                  style: RegisterStyles.subBody1,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration:
                                      buildInputDecoration("Cadilax@gmail.com"),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text("Referral code", style: AllStyle.text6),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  controller: _referalCode,
                                  style: RegisterStyles.subBody1,
                                  keyboardType: TextInputType.name,
                                  decoration:
                                      buildInputDecoration("Enter Code"),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text('Password*', style: AllStyle.text6),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: _password,
                                  obscureText: isObscuredPassword,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    hintStyle: AllStyle.text6,
                                    hintText: "Password",
                                    suffixIcon: IconButton(
                                      disabledColor: Colors.blueGrey,
                                      icon: Icon(
                                        isObscuredPassword
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                      ),
                                      onPressed:
                                          _togglePasswordStatusNewPassword,
                                      color: Colors.grey,
                                    ),
                                    labelStyle: RegisterStyles.subBody1,
                                    focusedBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(22)),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2.2),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2),
                                    ),
                                  ),
                                  validator: (e) {
                                    if (_password.text == " ") {
                                      return "Please enter password";
                                    } else if (_password.text.length < 6) {
                                      return "Password must be at least 6 Characters";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text('Confirm Password*',
                                    style: AllStyle.text6),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: _confirmPassword,
                                  obscureText: isObscuredConfirmPassword,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    hintStyle: AllStyle.text6,
                                    hintText: "Confirm Password",
                                    suffixIcon: IconButton(
                                      disabledColor: Colors.blueGrey,
                                      icon: Icon(
                                        isObscuredConfirmPassword
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                      ),
                                      onPressed:
                                          _togglePasswordStatusConfirmPassword,
                                      color: Colors.grey,
                                    ),
                                    labelStyle: RegisterStyles.subBody1,
                                    focusedBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2),
                                    ),
                                  ),
                                  validator: (e) {
                                    if (_confirmPassword.text == " ") {
                                      return "Please enter password";
                                    } else if (_password.text !=
                                        _confirmPassword.text) {
                                      return "Passwords do not match";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                //checked box and terms of agreement
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Transform.scale(
                                      scale: 1.0,
                                      child: Checkbox(
                                        value: isChecked,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            isChecked = value!;
                                          });
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                        "By Signing UP I Agree that i'm 18 years of age or older, \n"
                                        "to the user Agreement, Privacy Policy and Teams and condition.",
                                        textAlign: TextAlign.left,
                                        style: AllStyle.text9),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: deviceSize.width * 0.05),
                      child: GestureDetector(
                        onTap: isChecked
                            ? () async {
                                //validation
                                if (_formkey.currentState != null) {
                                  _formkey.currentState?.validate();
                                }

                                // Start ProgressIndicator
                                setState(() {
                                  isLoading = true;
                                });
                                // Creating user registeration mapData
                                final Map _data = {
                                  "username": _userName.text,
                                  "email": _email.text,
                                  "password": _password.text,
                                  "ref_code": _referalCode.text
                                };
                                // Gather and send data to Register post function
                                await AuthPostRequests.registerUser(_data);

                                // Stop ProgressIndicator
                                setState(() {
                                  isLoading = false;
                                });
                              }
                            : null,
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: MyButtons.loginButton,
                          child: Center(
                            child: Text(
                              isChecked
                                  ? "Register"
                                  : "Please, Agree to Terms and Conditions.",
                              style: AllStyle.buttonTextStyle,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                  ]),
            ),
          )),
    );
  }
}
