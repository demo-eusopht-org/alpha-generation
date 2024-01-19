import 'package:dio/dio.dart';
import 'package:noble_vintage/model/auth_model/signup_model.dart';
import 'package:noble_vintage/model/profile_model/forgot_password_model.dart';
import 'package:noble_vintage/model/profile_model/get_profle_model.dart';
import 'package:noble_vintage/model/profile_model/update_password_model.dart';
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

  @POST("user/update-password")
  Future<UpdatePasswordModel> updatePassword(
      @Header('Authorization') String token, @Body() Map<String, dynamic> body);

  @POST("user/forgot-password")
  Future<ForgotPasswordModel> forgotPassword(@Body() Map<String, dynamic> body);

  @GET("user/get-profile")
  Future<GetProfileModel> getProfile(@Header('Authorization') String token);
}
