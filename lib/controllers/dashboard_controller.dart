import 'package:electrum_flutter_code_challenge/models/user.dart';
import 'package:electrum_flutter_code_challenge/services/APIManager.dart';
import 'package:electrum_flutter_code_challenge/utils/helpers.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DashboardController extends GetxController {
  List<User> userList = [];
  static int pageNumber = 0;

  ScrollController controller = ScrollController();

  @override
  void onInit() async {
    controller.addListener(() async {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        await fetchDataFromApi();
      }
    });
    // TODO: implement onInit
    super.onInit();
  }

  fetchDataFromApi() async {
    pageNumber += 1;
    await APIManager.apiManager.fetchUsers(pageNumber);
    update();
  }

  addUser(User user) async {
    //add using api
    int userId = await APIManager.apiManager.CreateUser(user);
    if (userId > 0) {
      user.id = userId;
      userList.add(user);
      update();
      Helpers.showToast("User Created!!!");
    } else {
      Helpers.showToast("User Not Created!!!");
    }
  }

  updateUser(User updateUser) async {
    //Update using api

    if (await APIManager.apiManager.updateUser(updateUser)) {
      User updateUserNew = userList.where((user) => user.id == user.id).first;
      updateUserNew.firstName = updateUser.firstName;
      updateUserNew.lastName = updateUser.lastName;
      updateUserNew.email = updateUser.email;
      updateUserNew.avatar = updateUser.avatar;
      update();
      Helpers.showToast("User Updated!!!");
    } else {
      Helpers.showToast("User Not Updated!!!");
    }
  }

  deleteUser(User user) async {
    //Delete using api
    if (await APIManager.apiManager.deleteUser(user.id!)) {
      userList.remove(user);

      update();

      Helpers.showToast("User Deleted!!!");
    } else {
      Helpers.showToast("User Not Deleted!!!");
    }
  }

  resetAll() {
    userList.clear();
    pageNumber = 0;
  }
}
