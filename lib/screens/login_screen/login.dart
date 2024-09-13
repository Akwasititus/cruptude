import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/utils.dart';
import '../APIs/post_functions.dart';
import 'login_decoration/input_deco_design.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? name, email, phone;
  bool value = false;
  bool isLoading = false;

  //TextController to read text entered in text field
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _Password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _userName.dispose();
    _Password.dispose();
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  bool isObscuredPassword = true;
  bool isObscuredConfirmPassword = true;

  bool _obscureText1 = true;
  void _togglePasswordStatusNewPassword() {
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  Image.asset(
                    'images/splash.png',
                    height: 150,
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  //this widget holds the two text fields
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: deviceSize.width * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Welcome Back!', style: AllStyle.text11),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text("Don't have an account",
                                style: AllStyle.text12),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                //Getx navigation to registerScreen
                                Get.offNamed('/registerScreen');
                              },
                              child:
                                  Text('Sign up now!', style: AllStyle.text1),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('Email/Username', style: AllStyle.text6),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _userName,
                          validator: (e) {
                            if (_userName.text.isEmpty) {
                              return "Incorrect user Name or password";
                            } else {
                              return null;
                            }
                          },
                          style: RegisterStyles.subBody1,
                          keyboardType: TextInputType.emailAddress,
                          decoration:
                              buildInputDecoration("Email or User Name"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('Password', style: AllStyle.text6),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _Password,
                          obscureText: _obscureText1,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintStyle: AllStyle.text6,
                            hintText: "Password",
                            suffixIcon: IconButton(
                              disabledColor: Colors.blueGrey,
                              icon: Icon(
                                _obscureText1
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: _togglePasswordStatusNewPassword,
                              color: Colors.grey,
                            ),
                            labelStyle: RegisterStyles.subBody1,
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(22)),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2.2),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.2),
                            ),
                          ),
                          validator: (e) {
                            if (_Password.text.isEmpty) {
                              return "Please enter password";
                            } else if (_Password.text.length < 6) {
                              return "Password must be at least 6 Characters";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                                onTap: () {
                                  Get.toNamed('/recoveryEmail');
                                },
                                child: Text("Forget Password?",
                                    style: AllStyle.text6)),
                          ],
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
                      onTap: () async {
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
                          "password": _Password.text
                        };
                        // Gather and send data to Register post function
                        await AuthPostRequests.loginUser(_data);

                        // STOP ProgressIndicator
                        setState(() {
                          isLoading = false;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: MyButtons.loginButton,
                        child: Center(
                          child: Text(
                            'Login',
                            style: AllStyle.buttonTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
