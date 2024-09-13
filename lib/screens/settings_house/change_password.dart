import 'package:cryptude/screens/settings_house/update_success.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/utils.dart';
import '../login_screen/login_decoration/input_deco_design.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final GlobalKey<FormState> _formkeyEditPassword = GlobalKey<FormState>();

  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController email = TextEditingController();

  // make passcode obscured
  bool isObscuredPassword = true;
  //bool value = true;
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
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' ',
          style: AllStyle.amountBig,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onTap: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: deviceSize.width * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Text('Settings', style: AllStyle.text6)),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 12,
                      color: Colors.grey.shade300,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('Change Password', style: AllStyle.history),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text('New Password', style: AllStyle.amountBig),
                const SizedBox(
                  height: 15,
                ),
                Container(
                    decoration: BoxDecoration(
                        color: AppColors.referralTxtColor1real,
                        borderRadius: BorderRadius.circular(20)),
                    height: 300,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: deviceSize.width * 0.05),
                      child: Form(
                        key: _formkeyEditPassword,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text('Email', style: AllStyle.text6),
                            const SizedBox(
                              height: 7,
                            ),
                            TextFormField(
                              validator: (e) {
                                if (email.text == " ") {
                                  return "Please enter email";
                                } else if (!email.text.contains("@") ||
                                    !email.text.contains(".com")) {
                                  return "Please enter a valid email address";
                                } else {
                                  return null;
                                }
                              },
                              style: RegisterStyles.subBody1,
                              keyboardType: TextInputType.emailAddress,
                              decoration: buildInputDecoration("tam@ui8.net"),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text('Password', style: AllStyle.text6),
                            const SizedBox(
                              height: 7,
                            ),
                            TextFormField(
                              controller: password,
                              style: RegisterStyles.subBody1,
                              obscureText: isObscuredPassword,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                hintText: "Password",
                                suffixIcon: IconButton(
                                  disabledColor: Colors.blueGrey,
                                  icon: Icon(
                                    isObscuredPassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: _togglePasswordStatusNewPassword,
                                  color: Colors.grey,
                                ),
                                labelStyle: RegisterStyles.subBody1,
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 2),
                                ),
                              ),
                              validator: (e) {
                                if (password.text == " ") {
                                  return "Please enter password";
                                } else if (password.text.length < 6) {
                                  return "Password must be at least 6 Characters";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text('Confirm Password', style: AllStyle.text6),
                            const SizedBox(
                              height: 7,
                            ),
                            TextFormField(
                              controller: confirmPassword,
                              style: RegisterStyles.subBody1,
                              obscureText: isObscuredConfirmPassword,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                hintText: "Password",
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
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 2),
                                ),
                              ),
                              validator: (e) {
                                if (confirmPassword.text == " ") {
                                  return "Please enter password";
                                } else if (password.text !=
                                    confirmPassword.text) {
                                  return "Passwords do not match";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () async {
                    if (_formkeyEditPassword.currentState != null) {
                      _formkeyEditPassword.currentState?.validate();
                    }
                    //Getx navigation to the home screen
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return UpdateSuccess();
                        });
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: MyButtons.loginButton,
                    child: Center(
                      child: Text(
                        'Update',
                        style: AllStyle.buttonTextStyle,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
