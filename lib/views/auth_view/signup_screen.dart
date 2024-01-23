import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:noble_vintage/model/auth_model/signup_model.dart';
import 'package:noble_vintage/utils/constants.dart';
import 'package:noble_vintage/views/auth_view/login_screen.dart';
import 'package:noble_vintage/views/settings/terms_of_service.dart';
import 'package:noble_vintage/widgets/bottom_Navigation.dart';
import 'package:noble_vintage/widgets/custom_button.dart';
import 'package:noble_vintage/widgets/custom_widgets.dart';
import 'package:noble_vintage/widgets/email_validator.dart';

import '../../controller/user_controller.dart';
import '../../services/local_storage_service.dart';
import '../../services/locator.dart';
import '../../widgets/custom_textfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final userController = Get.put(UserController());
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GoogleSignIn _googleSignIn =
      GoogleSignIn(scopes: ['email'], clientId: Constants.clientId);
  bool hidePassword = true;
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

  Future<void> onSignup() async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      try {
        userController.loading.value = true;
        SignUpModel signUpModel = await userController.signUp(
          usernameController.text.trim(),
          '',
          '',
          emailController.text.trim(),
          passController.text.trim(),
        );
        if (signUpModel.status == 200) {
          userController.loading.value = false;
          customToast(signUpModel.message);
          Get.offAll(
            () => LoginScreen(),
          );
          confirmPasswordController.clear();
        } else {
          customToast('Something went wrong');
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }

  Future<bool> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
      return true;
    } catch (error) {
      print('Error signing in: $error');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Top-left image
          Positioned(
            top: 33,
            left: 0,
            child: Image.asset(
              'assets/images/Blank-T-Shirt.png',
              width: MediaQuery.of(context).size.width * 0.4,
            ),
          ),

          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              'assets/images/Leather-Bag.png',
              width: MediaQuery.of(context).size.width * 0.4,
            ),
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Sign Up',
                          style: GoogleFonts.inter(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              'assets/images/Ellipse 1.png',
                              height: 80,
                            ),
                            Image.asset(
                              'assets/images/Account.png',
                              height: 50,
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          textCapitalization: TextCapitalization.words,
                          controller: emailController,
                          hintText: 'Email address',
                          validatorCondition: (String? input) =>
                              input!.isValidEmail() ? null : "Invalid Email",
                        ),
                        SizedBox(height: 10),
                        CustomTextField(
                          textCapitalization: TextCapitalization.words,
                          controller: usernameController,
                          hintText: 'Username',
                          validatorCondition: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
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
                        SizedBox(height: 10),
                        CustomTextField(
                          controller: confirmPasswordController,
                          showPasswordHideButton: true,
                          hintText: 'Confirm Password',
                          validatorCondition: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your confirm password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: Get.width * 0.3,
                          child: Obx(
                            () => RoundedElevatedButton(
                              loading: userController.loading.value,
                              borderRadius: 23,
                              text: 'Sign up',
                              onPressed: () async {
                                await onSignup();
                                // Get.to(
                                //   () => MainScreen(),
                                // );
                              },
                            ),
                          ),
                        ),
                        Container(
                          height: Get.height * 0.15,
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
                              // _handleSignIn();
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
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              () => MainScreen(),
                            );
                          },
                          child: Text(
                            'Sign up later',
                            style: GoogleFonts.inter(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Constants.backgroundContColor,
                            ),
                          ),
                        ),
                        Container(
                          height: Get.height * 0.04,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(
                              () => TermsOfServiceScreen(),
                            );
                          },
                          child: Text(
                            'Terms Of Service',
                            style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
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
