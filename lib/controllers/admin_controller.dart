import 'package:electrum_flutter_code_challenge/models/admin.dart';
import 'package:electrum_flutter_code_challenge/services/database.dart';
import 'package:get/get.dart';

class AdminController extends GetxController {
  Rx<Admin?> loggedInUser = Admin().obs;

  registerNewUser(Admin user) async {
    loggedInUser.value = await DBProvider.db.signUpUser(user);
    return loggedInUser.value;
  }

  loginUser(String emailUsername, String password) async {
    loggedInUser.value = await DBProvider.db.loginUser(emailUsername, password);
    return loggedInUser.value;
  }
}
