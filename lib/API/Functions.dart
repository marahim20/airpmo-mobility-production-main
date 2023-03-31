import 'dart:async';
import 'package:airpmp_mobility/API/ApiClass.dart';
import 'package:airpmp_mobility/Constants/Classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

//<==============Secure Storage=================>

final SecureStorage secureStorage = SecureStorage();

FutureOr<void> saveToken(String token) async {
  secureStorage.writeSecureData("token", token);
  print("Token has been saved");
}

Future<String> getToken() async {
  String token = await secureStorage.readSecureData("token") ?? "";
  return token;
}

FutureOr<void> saveCredentials(String username, String password) async {
  secureStorage.writeSecureData("password", password);
  secureStorage.writeSecureData("username", username);
}

Future<Map<String, String>> getCredentials() async {
  ///Username: ["username"] , Password: ["password"]
  String password = await secureStorage.readSecureData("password") ?? "";
  String user = await secureStorage.readSecureData("username") ?? "";
  return {"username": user, "password": password};
}

// this simply checks if the token exists or not
Future<LoginDetails>? getLoginDetais() async {
  print("Helo");
  // await secureStorage.writeSecureData("token", "testToken");
  String token = await secureStorage.readSecureData("token") ?? "";
  print("Token is $token");
  if (token != "") {
    Map<String, String> cred = await getCredentials();
    LoginDetails log = await ApiClass().login(
        username: cred["username"] ?? "", password: cred["password"] ?? "");
    return log;
  }

  return LoginDetails.empty();
}

FutureOr<void> saveCompanyId(String companyId) async {
  secureStorage.writeSecureData("companyId", companyId);
  print("Company Id has been saved");
}

FutureOr<String> getCompanyId() async {
  String companyId = await secureStorage.readSecureData("companyId") ??
      "Company Id is invalid";
  return companyId;
}

FutureOr<void> saveProjectId(String userId) async {
  secureStorage.writeSecureData("projectId", userId);
  print("Project Id has been saved");
}

FutureOr<String> getProjectId() async {
  String projectId = await secureStorage.readSecureData("projectId") ??
      "Project Id is invalid";
  return projectId;
}

FutureOr<void> saveUserId(String userId) async {
  secureStorage.writeSecureData("userId", userId);
  print("User Id has been saved");
}

FutureOr<String> getUserId() async {
  String userId =
      await secureStorage.readSecureData("userId") ?? "User Id is invalid";
  return userId;
}
