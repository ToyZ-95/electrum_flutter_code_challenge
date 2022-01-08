import 'package:electrum_flutter_code_challenge/constants/constants.dart';
import 'package:electrum_flutter_code_challenge/controllers/admin_controller.dart';
import 'package:electrum_flutter_code_challenge/screens/dashboard.dart';
import 'package:electrum_flutter_code_challenge/screens/signup_screen.dart';
import 'package:electrum_flutter_code_challenge/utils/helpers.dart';
import 'package:electrum_flutter_code_challenge/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  AdminController userController = Get.find();

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
              Image.asset('assets/loginImage.png'),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                'Login',
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
                      textEditingController: emailTextEditingController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Email or Username";
                        }
                        return null;
                      },
                      hintText: 'Email / Username',
                      prefixIcon: const Icon(
                        Icons.input_outlined,
                        color: Colors.black54,
                      ),
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
                          return "Enter password";
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
                          await userController.loginUser(
                              emailTextEditingController.text,
                              passwordTextEditingController.text);

                          if (userController
                              .loggedInUser.value!.username!.isNotEmpty) {
                            Get.to(Dashboard());
                          } else {
                            Helpers.showToast('User not found');
                          }
                        }
                      },
                      child: const Text(
                        'Login',
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
                  const Text("New to UserDataApp?"),
                  TextButton(
                    onPressed: () {
                      Get.off(
                        SignUpScreen(),
                      );
                    },
                    child: const Text(
                      "Register",
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
