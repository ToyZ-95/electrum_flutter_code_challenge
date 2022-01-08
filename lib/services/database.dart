import 'dart:io';
import 'package:electrum_flutter_code_challenge/models/admin.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    // if _database is null we instantiate it
    _database = await initDB();

    await createTables();

    return _database!;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "AppData.db");
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) {},
    );
  }

  Future<void> createTables() async {
    final db = await database;

    //await db.execute("DROP TABLE IF EXISTS Users;");

    await db.execute(
      "CREATE TABLE  IF NOT EXISTS Admin ("
      "FirstName TEXT,"
      "LastName TEXT,"
      "Password TEXT,"
      "Username TEXT,"
      "Email TEXT"
      ")",
    );
  }

  Future<Admin?> loginUser(String emailUsername, String password) async {
    final db = await database;

    Admin? user = Admin();

    String query =
        "SELECT * FROM Admin WHERE (Email = '$emailUsername' OR UserName = '$emailUsername') AND Password = '$password'";

    List<Map<String, Object?>> rawData = await db.rawQuery(query);

    List<Admin> list =
        rawData.isNotEmpty ? rawData.map((u) => Admin.fromMap(u)).toList() : [];

    if (list.isNotEmpty) {
      user = list[0];
    }
    return user;
  }

  Future<Admin?> checkIfUserExists(String emailOrUsername) async {
    final db = await database;

    Admin? user;

    String query =
        "SELECT * FROM Admin WHERE Email = '$emailOrUsername' OR Password = '$emailOrUsername'";

    List<Map<String, Object?>> rawData = await db.rawQuery(query);

    List<Admin> list =
        rawData.isNotEmpty ? rawData.map((u) => Admin.fromMap(u)).toList() : [];

    if (list.isNotEmpty) {
      user = list[0];
    }

    return user;
  }

  Future<Admin> signUpUser(Admin newUser) async {
    final db = await database;

    Admin? registeredUser = await checkIfUserExists(newUser.email!);

    if (registeredUser != null) {
      return Admin();
    }

    registeredUser = await checkIfUserExists(newUser.username!);

    if (registeredUser != null) {
      return Admin();
    }

    String query =
        "INSERT INTO Admin (FirstName, LastName, Password, Username, Email) VALUES ('${newUser.firstName}', '${newUser.lastName}', '${newUser.password}', '${newUser.username}', '${newUser.email}')";

    await db.rawInsert(query);

    return newUser;
  }
}
