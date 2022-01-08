import 'package:electrum_flutter_code_challenge/constants/constants.dart';
import 'package:electrum_flutter_code_challenge/controllers/admin_controller.dart';
import 'package:electrum_flutter_code_challenge/models/admin.dart';
import 'package:electrum_flutter_code_challenge/utils/helpers.dart';
import 'package:electrum_flutter_code_challenge/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dashboard.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  TextEditingController firstNameTextEditingController =
      TextEditingController();
  TextEditingController lastNameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController usernameTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController confirmPasswordTextEditingController =
      TextEditingController();

  AdminController adminController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.only(top: 50.0, left: 24.0, right: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image.asset('assets/signupImage.png'),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                'Sign Up',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32.0,
                    letterSpacing: 1.2),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      textEditingController: firstNameTextEditingController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter First Name";
                        }
                        return null;
                      },
                      hintText: 'First Name',
                      prefixIcon: const Icon(Icons.person_outlined,
                          color: Colors.black54),
                      obsecureText: false,
                      enabled: true,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextFormField(
                      textEditingController: lastNameTextEditingController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Last Name";
                        }
                        return null;
                      },
                      hintText: 'Last Name',
                      prefixIcon: const Icon(Icons.person_outlined,
                          color: Colors.black54),
                      obsecureText: false,
                      enabled: true,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextFormField(
                      textEditingController: emailTextEditingController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Email";
                        }
                        return null;
                      },
                      hintText: 'Email',
                      prefixIcon: const Icon(Icons.email_outlined,
                          color: Colors.black54),
                      obsecureText: false,
                      enabled: true,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextFormField(
                      textEditingController: usernameTextEditingController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Username";
                        }
                        return null;
                      },
                      hintText: 'Username',
                      prefixIcon: const Icon(Icons.person_outlined,
                          color: Colors.black54),
                      obsecureText: false,
                      enabled: true,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextFormField(
                      textEditingController: passwordTextEditingController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Password";
                        }
                        return null;
                      },
                      hintText: 'Password',
                      prefixIcon:
                          const Icon(Icons.lock_outline, color: Colors.black54),
                      obsecureText: true,
                      enabled: true,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextFormField(
                      textEditingController:
                          confirmPasswordTextEditingController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Password";
                        }
                        if (value != passwordTextEditingController.text) {
                          return "Password is not matching";
                        }
                        return null;
                      },
                      hintText: 'Confirm Password',
                      prefixIcon:
                          const Icon(Icons.lock_outline, color: Colors.black54),
                      obsecureText: true,
                      enabled: true,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                        elevation: 0.0,
                        minimumSize: Size(
                          MediaQuery.of(context).size.width - 24.0,
                          50.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      onPressed: () async {
                        //Dismiss the keyboard by taking away the focus of the TextFormField and giving it to an unused FocusNode
                        FocusScope.of(context).requestFocus(FocusNode());

                        if (_formKey.currentState!.validate()) {
                          await adminController.registerNewUser(Admin(
                              firstName: firstNameTextEditingController.text,
                              lastName: lastNameTextEditingController.text,
                              email: emailTextEditingController.text,
                              username: usernameTextEditingController.text,
                              password: passwordTextEditingController.text));

                          if (adminController
                              .loggedInUser.value!.username!.isNotEmpty) {
                            Get.to(Dashboard());
                          } else {
                            Helpers.showToast(
                                'Email or password already registered!!');
                          }
                        }
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already Using UserDataApp?"),
                  TextButton(
                    onPressed: () {
                      Get.off(
                        LoginScreen(),
                      );
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Color(0xff0065FF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
