import 'package:dio/dio.dart';
import 'package:noble_vintage/model/auth_model/signup_model.dart';
import 'package:retrofit/http.dart';

import '../../model/auth_model/login_model.dart';
import '../../utils/constants.dart';

part 'auth_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AuthApi {
  factory AuthApi(Dio dio, {String baseUrl}) = _AuthApi;
  @POST("user/login")
  Future<LoginModel> login(@Body() Map<String, dynamic> body);

  @POST("user/sign-up")
  Future<SignUpModel> userSignUp(@Body() Map<String, dynamic> body);
}
