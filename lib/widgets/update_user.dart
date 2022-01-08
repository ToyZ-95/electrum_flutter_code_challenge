import 'package:electrum_flutter_code_challenge/constants/constants.dart';
import 'package:electrum_flutter_code_challenge/controllers/dashboard_controller.dart';
import 'package:electrum_flutter_code_challenge/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_textformfield.dart';

class UpdateUserBottomSheet extends StatelessWidget {
  UpdateUserBottomSheet({Key? key, required this.userData}) : super(key: key);

  TextEditingController idTextEditingController = TextEditingController();
  TextEditingController firstNameTextEditingController =
      TextEditingController();
  TextEditingController lastNameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController imageTextEditingController = TextEditingController();

  DashboardController dashboardController = Get.find();

  User userData;

  @override
  Widget build(BuildContext context) {
    idTextEditingController.text = userData.id.toString();
    firstNameTextEditingController.text = userData.firstName!;
    lastNameTextEditingController.text = userData.lastName!;
    emailTextEditingController.text = userData.email!;
    imageTextEditingController.text = userData.avatar!;

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
                  hintText: '',
                  obsecureText: false,
                  enabled: false,
                  textEditingController: idTextEditingController,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                CustomTextFormField(
                  textEditingController: firstNameTextEditingController,
                  hintText: '',
                  obsecureText: false,
                  enabled: true,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                CustomTextFormField(
                  textEditingController: lastNameTextEditingController,
                  hintText: '',
                  obsecureText: false,
                  enabled: true,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                CustomTextFormField(
                  textEditingController: emailTextEditingController,
                  hintText: '',
                  obsecureText: false,
                  enabled: true,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                CustomTextFormField(
                  textEditingController: imageTextEditingController,
                  hintText: '',
                  obsecureText: false,
                  enabled: true,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextButton(
                  onPressed: () {
                    dashboardController.updateUser(User(
                        id: userData.id,
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
                    'Update',
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
