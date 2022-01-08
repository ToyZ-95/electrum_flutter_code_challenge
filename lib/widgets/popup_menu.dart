import 'package:electrum_flutter_code_challenge/controllers/dashboard_controller.dart';
import 'package:electrum_flutter_code_challenge/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'delete_user.dart';
import 'update_user.dart';

class Popupmenu extends StatelessWidget {
  Popupmenu({Key? key, required this.userData}) : super(key: key);

  DashboardController dashboardController = Get.find();

  User userData;

  showBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return UpdateUserBottomSheet(userData: userData);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    void handleClick(String value) {
      switch (value) {
        case 'Update User':
          showBottomSheet(context);
          break;
        case 'Delete User':
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return DeleteUser(userData: userData);
              });
          break;
      }
    }

    return PopupMenuButton<String>(
      onSelected: handleClick,
      itemBuilder: (BuildContext context) {
        return {'Update User', 'Delete User'}.map((
          String choice,
        ) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
    );
  }
}
