import 'package:electrum_flutter_code_challenge/constants/constants.dart';
import 'package:electrum_flutter_code_challenge/controllers/dashboard_controller.dart';
import 'package:electrum_flutter_code_challenge/widgets/add_new_user.dart';
import 'package:electrum_flutter_code_challenge/widgets/popup_menu.dart';
import 'package:electrum_flutter_code_challenge/widgets/side_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);

  DashboardController dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    dashboardController.fetchDataFromApi();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users Data'),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return AddNewUserBottomSheet();
                },
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
        backgroundColor: primaryColor,
      ),
      body: GetBuilder<DashboardController>(
        builder: (value) => ListView.builder(
            itemExtent: 100,
            controller: value.controller,
            itemCount: value.userList.length + 1,
            itemBuilder: (context, index) {
              if (index == value.userList.length) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              Image img;

              if (value.userList[index].avatar == null ||
                  value.userList[index].avatar!.isEmpty) {
                img = Image.asset(
                  'assets/default_avatar.jpg',
                  height: 50.0,
                  width: 50.0,
                );
              } else {
                img = Image.network(
                  value.userList[index].avatar!,
                  height: 50.0,
                  width: 50.0,
                );
              }

              return Card(
                child: ListTile(
                  leading: img,
                  title: Text(value.userList[index].firstName.toString() +
                      ' ' +
                      value.userList[index].lastName.toString()),
                  subtitle: Text(value.userList[index].email!),
                  trailing: Popupmenu(userData: value.userList[index]),
                ),
              );
            }),
      ),
      drawer: SideDrawer(),
    );
  }
}
