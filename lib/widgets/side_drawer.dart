import 'package:electrum_flutter_code_challenge/constants/constants.dart';
import 'package:electrum_flutter_code_challenge/controllers/admin_controller.dart';
import 'package:electrum_flutter_code_challenge/controllers/dashboard_controller.dart';
import 'package:electrum_flutter_code_challenge/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideDrawer extends StatelessWidget {
  AdminController adminController = Get.find();
  DashboardController dashboardController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text(
                'Hi, ${adminController.loggedInUser.value!.username}',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            decoration: const BoxDecoration(
              color: primaryColor,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              dashboardController.resetAll();
              Get.offAll(LoginScreen());
            },
          ),
        ],
      ),
    );
  }
}
