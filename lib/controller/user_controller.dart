import 'package:get/get.dart';
import 'package:noble_vintage/api/auth/auth_api.dart';
import 'package:noble_vintage/model/auth_model/login_model.dart';
import 'package:noble_vintage/model/auth_model/signup_model.dart';
import 'package:noble_vintage/model/profile_model/forgot_password_model.dart';
import 'package:noble_vintage/model/profile_model/get_profle_model.dart';
import 'package:noble_vintage/model/profile_model/update_password_model.dart';

import '../api/dio.dart';
import '../services/local_storage_service.dart';
import '../services/locator.dart';
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

  Future<UpdatePasswordModel> userUpdatePassword(
      {required String currentPassword, required String newPassword}) async {
    loading.value = true;
    final updatepassword = AuthApi(dio, baseUrl: Constants.baseUrl);
    final token = await locator<LocalStorageService>().getData('token');
    final value = await updatepassword.updatePassword('Bearer $token', {
      'currentPassword': currentPassword,
      'newPassword': newPassword,
    });
    loading.value = false;
    return value;
  }

  Future<ForgotPasswordModel> userForgotPassword({
    required String email,
  }) async {
    loading.value = true;
    final forgotpassword = AuthApi(dio, baseUrl: Constants.baseUrl);
    final value = await forgotpassword.forgotPassword({
      'email': email,
    });
    loading.value = false;
    return value;
  }

  Future<GetProfileModel> getUserProfile() async {
    loading.value = true;
    final token = await locator<LocalStorageService>().getData('token');
    final getProfiles = AuthApi(dio, baseUrl: Constants.baseUrl);
    final value = await getProfiles.getProfile('Bearer $token');
    loading.value = false;
    return value;
  }
}
