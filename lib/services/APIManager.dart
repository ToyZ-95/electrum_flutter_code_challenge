import 'dart:convert' as convert;
import 'package:electrum_flutter_code_challenge/controllers/dashboard_controller.dart';
import 'package:electrum_flutter_code_challenge/models/user.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class APIManager {
  static APIManager? _apiManager;

  static String baseUrl = "reqres.in";

  static APIManager get apiManager {
    if (_apiManager != null) {
      return _apiManager!;
    }

    return _apiManager = APIManager();
  }

  DashboardController dashboardController = Get.find();

  fetchUsers(int pageNumber) async {
    List<User> fetchedUsers = [];

    final queryParameters = {'page': '$pageNumber', 'per_page': '10'};

    var url = Uri.https(baseUrl, '/api/users', queryParameters);

    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
      //var itemCount = jsonResponse['totalItems'];
      List<dynamic> data = jsonResponse["data"];
      for (int i = 0; i < data.length; i++) {
        dashboardController.userList.add(User.fromMap(jsonResponse["data"][i]));
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  Future<int> CreateUser(User user) async {
    final queryParameters = {
      'email': '${user.email}',
      'first_name': '${user.firstName}',
      'last_name': '${user.lastName}',
      'avatar': '${user.avatar}',
    };

    var url = Uri.https(baseUrl, '/api/users', queryParameters);

    var response = await http.post(url);

    if (response.statusCode == 201) {
      Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
      int id = int.parse(jsonResponse["id"]);
      print('User ${user.id} created!!!');
      return id;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return -1;
    }
  }

  Future<bool> deleteUser(int id) async {
    var url = Uri.https(
      baseUrl,
      '/api/users/$id',
    );

    var response = await http.delete(url);
    if (response.statusCode == 204) {
      print('User $id deleted!!!');
      return true;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return false;
    }
  }

  Future<bool> updateUser(User user) async {
    final queryParameters = {
      'email': '${user.email}',
      'first_name': '${user.firstName}',
      'last_name': '${user.lastName}',
      'avatar': '${user.avatar}',
    };

    var url = Uri.https(baseUrl, '/api/users/${user.id}', queryParameters);

    var response = await http.put(
      url,
    );
    if (response.statusCode == 200) {
      print('User ${user.id} updated!!!');
      return true;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return false;
    }
  }
}
