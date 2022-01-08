import 'package:electrum_flutter_code_challenge/constants/constants.dart';
import 'package:electrum_flutter_code_challenge/controllers/dashboard_controller.dart';
import 'package:electrum_flutter_code_challenge/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteUser extends StatelessWidget {
   DeleteUser({ Key? key , required this.userData}) : super(key: key);

  DashboardController dashboardController = Get.find();
  User userData;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
                  title: Row(
                    children: const [
                      Icon(
                        Icons.delete_forever_outlined,
                        color: Colors.redAccent,
                        size: 32.0,
                      ),
                      Text(
                        'Do you want to delete it?',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          dashboardController.deleteUser(userData);
                          Get.back();
                        },
                        style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.redAccent),
                        child: const Text('Delete'),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: primaryColor,
                        ),
                        child: const Text('Nope'),
                      ),
                    ],
                  ),
                );
  }
}