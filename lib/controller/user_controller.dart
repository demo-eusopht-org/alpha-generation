import 'package:get/get.dart';
import 'package:noble_vintage/api/auth/auth_api.dart';
import 'package:noble_vintage/model/auth_model/login_model.dart';
import 'package:noble_vintage/model/auth_model/signup_model.dart';

import '../api/dio.dart';
import '../utils/constants.dart';

class UserController extends GetxController {
  RxBool loading = false.obs;

  Future<LoginModel> login(String email, String password) async {
    print('hello');
    final loginModel = AuthApi(dio, baseUrl: Constants.baseUrl);
    final value = await loginModel.login({
      'email': email,
      'password': password,
    });
    return value;
  }

  Future<SignUpModel> signUp(
    String username,
    String firstname,
    String lastname,
    String email,
    String password,
  ) async {
    print('hello');
    final signUpModel = AuthApi(dio, baseUrl: Constants.baseUrl);
    final value = await signUpModel.userSignUp({
      'username': username,
      "first_name": firstname,
      "last_name": lastname,
      'email': email,
      'password': password,
    });
    return value;
  }
}
