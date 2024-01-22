import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:noble_vintage/model/auth_model/login_model.dart';
import 'package:noble_vintage/services/local_storage_service.dart';
import 'package:noble_vintage/services/locator.dart';
import 'package:noble_vintage/utils/constants.dart';
import 'package:noble_vintage/views/auth_view/signup_screen.dart';
import 'package:noble_vintage/views/settings/forgot_password.dart';
import 'package:noble_vintage/views/settings/terms_of_service.dart';
import 'package:noble_vintage/widgets/bottom_Navigation.dart';
import 'package:noble_vintage/widgets/custom_widgets.dart';
import 'package:noble_vintage/widgets/email_validator.dart';

import '../../controller/user_controller.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userController = Get.put(UserController());
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _getFirstName(String fullName) {
    if (fullName == null || fullName.isEmpty) {
      return '';
    }

    List<String> nameParts = fullName.split(' ');
    return nameParts.isNotEmpty ? nameParts[0] : '';
  }

  String _getLastName(String fullName) {
    if (fullName == null || fullName.isEmpty) {
      return '';
    }

    List<String> nameParts = fullName.split(' ');
    return nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '';
  }

  Future<void> onLogin() async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      try {
        userController.loading.value = true;
        LoginModel loginModel = await userController.login(
          emailController.text.trim(),
          passController.text.trim(),
        );
        if (loginModel.status == 200) {
          userController.loading.value = false;
          customToast(loginModel.message);
          Get.offAll(
            () => MainScreen(),
          );

          if (loginModel.token != null) {
            await locator<LocalStorageService>().saveData(
              'token',
              loginModel.token!,
            );
          }
        } else {
          throw Exception(loginModel.message ?? 'Invalid email or password!');
        }
      } on DioException catch (e) {
        userController.loading.value = false;
        customToast(e.response?.data['message'] ?? e.message);
      } catch (e) {
        userController.loading.value = false;
        customToast(e.toString());
      }
    }
  }

  Future<void> googlelogin() async {
    try {
      await _googleSignIn.signIn();
      final userLogin = await userController.userLoginWithGoogle(
        firstname: _getFirstName(_googleSignIn.currentUser?.displayName ?? ''),
        lastname: _getLastName(_googleSignIn.currentUser?.displayName ?? ''),
        email: _googleSignIn.currentUser?.email ?? '',
        googleId: _googleSignIn.currentUser?.id ?? '',
      );

      if (userLogin.status == 200) {
        if (userLogin.token != null) {
          await locator<LocalStorageService>().saveData(
            'token',
            userLogin.token!,
          );
        }
        customToast(userLogin.message);
        Get.offAll(
          () => MainScreen(),
        );
      } else {
        throw Exception(userLogin.message ?? 'Invalid email!');
      }
    } on DioException catch (e) {
      customToast(e.response?.data['message'] ?? e.message);
    } catch (e) {
      customToast(e.toString());
    }
  }

  Future<bool> _handleSignIn() async {
    try {
      // await _googleSignIn.disconnect();
      await _googleSignIn.signIn();
      return true;
    } catch (error) {
      print('Error signing in: $error');
      return false;
    }
  }

  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              'assets/images/Rolex-Watch.png',
              width: MediaQuery.of(context).size.width * 0.34,
            ),
          ),
          SizedBox.fromSize(
            size: MediaQuery.sizeOf(context),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.2,
                      ),
                      Text(
                        'Log in',
                        style: GoogleFonts.inter(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Constants.backgroundContColor,
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(20),
                        child: Image.asset(
                          'assets/images/Account.png',
                          height: 50,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomTextField(
                        textCapitalization: TextCapitalization.words,
                        controller: emailController,
                        hintText: 'Email Address',
                        validatorCondition: (String? input) =>
                            input!.isValidEmail() ? null : "Invalid Email",
                      ),
                      SizedBox(height: 10),
                      CustomTextField(
                        controller: passController,
                        showPasswordHideButton: true,
                        hintText: 'Password',
                        validatorCondition: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(
                            () => ForgotPassword(),
                          );
                        },
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            'Forgot Password?',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: Get.width * 0.3,
                        child: Obx(
                          () => RoundedElevatedButton(
                            loading: userController.loading.value,
                            borderRadius: 23,
                            text: 'Login',
                            onPressed: () async {
                              await onLogin();
                              // Get.to(
                              //   () => MainScreen(),
                              // );
                            },
                          ),
                        ),
                      ),
                      // Container(
                      //   width: Get.width * 0.3,
                      //   child: Obx(
                      //     () => RoundedElevatedButton(
                      //       loading: userController.loading.value,
                      //       borderRadius: 23,
                      //       text: 'Signup',
                      //       onPressed: () async {
                      //         Get.to(() => SignupScreen());
                      //         // Get.to(
                      //         //   () => MainScreen(),
                      //         // );
                      //       },
                      //     ),
                      //   ),
                      // ),
                      Container(
                        height: Get.height * 0.1,
                      ),
                      Container(
                        height: Get.height * 0.06,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Constants.backgroundContColor,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          onPressed: () async {
                            await googlelogin();
                            print('checkUser${_googleSignIn.currentUser}');
                            // Get.to(() => MainScreen());
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Image(
                                image: AssetImage(
                                  "assets/images/Google.png",
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 24, right: 8),
                                child: Text(
                                  'Sign in with Google',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(
                            () => MainScreen(),
                          );
                        },
                        child: Text(
                          'Log in later',
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Constants.backgroundContColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'OR',
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Constants.backgroundContColor,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(
                            () => SignupScreen(),
                          );
                        },
                        child: Text(
                          'Sign up',
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Constants.backgroundContColor,
                          ),
                        ),
                      ),
                      Container(height: Get.height * 0.05),
                      InkWell(
                        onTap: () {
                          Get.to(() => TermsOfServiceScreen());
                        },
                        child: Text(
                          'Terms Of Service',
                          style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
