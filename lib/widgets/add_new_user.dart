import 'package:electrum_flutter_code_challenge/constants/constants.dart';
import 'package:electrum_flutter_code_challenge/controllers/dashboard_controller.dart';
import 'package:electrum_flutter_code_challenge/models/user.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'custom_textformfield.dart';

class AddNewUserBottomSheet extends StatelessWidget {
  AddNewUserBottomSheet({Key? key}) : super(key: key);

  TextEditingController firstNameTextEditingController =
      TextEditingController();
  TextEditingController lastNameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController imageTextEditingController = TextEditingController();

  DashboardController dashboardController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                top: 10.0,
                right: 10.0,
                left: 10.0),
            child: Column(
              children: [
                CustomTextFormField(
                  textEditingController: firstNameTextEditingController,
                  hintText: 'First Name',
                  obsecureText: false,
                  enabled: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter First Name";
                    }
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                CustomTextFormField(
                  textEditingController: lastNameTextEditingController,
                  hintText: 'Last Name',
                  obsecureText: false,
                  enabled: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Last Name";
                    }
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                CustomTextFormField(
                  textEditingController: emailTextEditingController,
                  hintText: 'Email',
                  obsecureText: false,
                  enabled: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Email";
                    }
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                CustomTextFormField(
                  textEditingController: imageTextEditingController,
                  hintText: 'Image Url',
                  obsecureText: false,
                  enabled: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Image URL";
                    }
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextButton(
                  onPressed: () {
                    dashboardController.addUser(User(
                        firstName: firstNameTextEditingController.text,
                        lastName: lastNameTextEditingController.text,
                        email: emailTextEditingController.text,
                        avatar: imageTextEditingController.text));
                    Get.back();
                  },
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: primaryColor,
                    minimumSize: Size(
                      MediaQuery.of(context).size.width - 20.0,
                      50.0,
                    ),
                  ),
                  child: const Text(
                    'Add User',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
