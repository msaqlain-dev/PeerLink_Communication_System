import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peerlink_mobileapp/Screens/login_signup_screen/login_controller.dart';
import 'package:peerlink_mobileapp/res/assets/image_assets.dart';
import 'package:peerlink_mobileapp/res/colors/app_color.dart';
import 'package:peerlink_mobileapp/res/components/custom_text.dart';
import 'package:peerlink_mobileapp/res/components/round_button.dart';
import 'package:peerlink_mobileapp/res/navigators/routes_name.dart';
import 'package:peerlink_mobileapp/utils/responsive_size_util.dart';
import 'package:peerlink_mobileapp/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // Image.asset(
                  //   ImageAssets.partyMapLogo,
                  //   width: 250,
                  // ),
                  SizedBox(
                    height: ResponsiveSizeUtil.scaleFactorHeight * 50,
                  ),
                  CustomText(
                    text: 'Login',
                    color: AppColor.primaryColor,
                    fontSize: 42,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    height: ResponsiveSizeUtil.scaleFactorHeight * 50,
                  ),
                  Container(
                    height: ResponsiveSizeUtil.size60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(ResponsiveSizeUtil.size10),
                      color: const Color(0xFFF0F0F0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: ResponsiveSizeUtil.size3,
                      ),
                      child: TextFormField(
                        controller: loginController.emailController.value,
                        focusNode: loginController.emailFocusNode.value,
                        validator: (value) {
                          if (value!.isEmpty) {
                            Utils.snakBar('Email', 'Enter Email');
                          }
                        },
                        onFieldSubmitted: (value) => {
                          Utils.fieldFocusChange(
                              context,
                              loginController.emailFocusNode.value,
                              loginController.passwordFocusNode.value)
                        },
                        style: TextStyle(
                          fontSize: ResponsiveSizeUtil.size15,
                          color: AppColor.blackColor,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.email_rounded,
                            color: AppColor.primaryColor,
                          ),
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            fontSize: ResponsiveSizeUtil.size15,
                            color: AppColor.greyColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // CustomTextField(label: 'Enter Email'),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: ResponsiveSizeUtil.size60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(ResponsiveSizeUtil.size10),
                      color: const Color(0xFFF0F0F0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: ResponsiveSizeUtil.size3,
                      ),
                      child: TextFormField(
                        controller: loginController.passwordController.value,
                        focusNode: loginController.passwordFocusNode.value,
                        validator: (value) {
                          if (value!.isEmpty) {
                            Utils.snakBar('Password', 'Enter Password');
                          }
                        },
                        onFieldSubmitted: (value) {},
                        obscureText: true,
                        obscuringCharacter: '●',
                        style: TextStyle(
                          fontSize: ResponsiveSizeUtil.size15,
                          color: AppColor.blackColor,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: AppColor.primaryColor,
                          ),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            fontSize: ResponsiveSizeUtil.size15,
                            color: AppColor.greyColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ResponsiveSizeUtil.scaleFactorHeight * 40,
            ),
            Obx(
              () => RoundButton(
                title: 'Login',
                width: double.infinity,
                height: ResponsiveSizeUtil.size60,
                fontSize: 22,
                fontWeight: FontWeight.w700,
                textColor: AppColor.primaryColor,
                buttonColor: AppColor.whiteColor,
                loading: loginController.loading.value,
                onPress: () {
                  if (_formKey.currentState!.validate()) {
                    loginController.loginApi();
                  }
                  // Get.toNamed(RouteName.dashboardScreen);
                },
              ),
            ),
            SizedBox(
              height: ResponsiveSizeUtil.scaleFactorHeight * 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: "don't have an account? ",
                  color: AppColor.whiteColor,
                  fontSize: ResponsiveSizeUtil.size16,
                  fontWeight: FontWeight.w500,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteName.signupScreen);
                  },
                  child: CustomText(
                    text: "Signup",
                    color: AppColor.primaryColor,
                    fontSize: ResponsiveSizeUtil.size16,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}