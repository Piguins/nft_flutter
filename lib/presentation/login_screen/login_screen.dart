import 'dart:collection';

import 'package:application/core/utils/prefrence_variable.dart';
import 'package:application/model/private_key.dart';
import 'package:application/service/auth_service.dart';
import 'package:application/service/private_key.dart';
import 'package:application/service/wallet_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/custom_text_form_field.dart'; // ignore_for_file: must_be_immutable

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    WalletService walletService = WalletService();
    AuthService.userStream.listen( (event)async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      if (event != null) {
        Navigator.pushReplacementNamed(context, AppRoutes.onBoardingScreen);
          var wallet = await walletService.findWalletByID(event.uid);
        if(wallet!=null){
          preferences.setString(PreferenceVariable.WALLET_ADDRESS, wallet.id);
        }
        else{
          preferences.remove(PreferenceVariable.WALLET_ADDRESS);
        }
      }
      else{
          preferences.remove(PreferenceVariable.WALLET_ADDRESS);
      }
    });
  }

  Future<void> handleGoogleLogin() async {
    GoogleAuthProvider _googleAuthProvider = GoogleAuthProvider();
    await _auth.signInWithProvider(_googleAuthProvider);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 21.h,
              vertical: 49.v,
            ),
            child: Column(
              children: [
                SizedBox(height: 40.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 34.h),
                    child: Text(
                      "Login",
                      style: theme.textTheme.displayMedium,
                    ),
                  ),
                ),
                SizedBox(height: 9.v),
                Container(
                  width: 313.h,
                  margin: EdgeInsets.only(
                    left: 34.h,
                    right: 40.h,
                  ),
                  child: Text(
                    "Continute discovering rate and orginal artworks",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleLarge,
                  ),
                ),
                SizedBox(height: 41.v),
                CustomOutlinedButton(
                  text: "Login with Google",
                  margin: EdgeInsets.only(
                    left: 34.h,
                    right: 43.h,
                  ),
                  leftIcon: Container(
                    margin: EdgeInsets.only(right: 19.h),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgGoogleicon1,
                      height: 29.adaptSize,
                      width: 29.adaptSize,
                    ),
                  ),
                  onPressed: () async {
                    await AuthService.signInWithGoogle();
                  },
                ),
                SizedBox(height: 54.v),
                _buildRowLineOneOne(context),
                SizedBox(height: 53.v),
                _buildColumnEmail(context),
                SizedBox(height: 14.v),
                _buildColumnPassword(context),
                SizedBox(height: 32.v),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 15.h),
                    child: Text(
                      "Forgot password",
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                ),
                SizedBox(height: 43.v),
                CustomElevatedButton(
                  text: "Login",
                  margin: EdgeInsets.only(
                    left: 55.h,
                    right: 43.h,
                  ),
                  onPressed: () => Navigator.pushReplacementNamed(
                      context, AppRoutes.onBoardingScreen),
                ),
                SizedBox(height: 41.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 29.h),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Not registered yet? ",
                            style: CustomTextStyles.titleSmallSemiBold_1,
                          ),
                          TextSpan(
                            text: "Create an account",
                            style:
                                CustomTextStyles.titleSmallOnSecondaryContainer,
                          )
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildRowLineOneOne(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 3.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 10.v,
              bottom: 11.v,
            ),
            child: SizedBox(
              width: 102.h,
              child: Divider(),
            ),
          ),
          Text(
            "Or login with email",
            style: theme.textTheme.titleSmall,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 10.v,
              bottom: 11.v,
            ),
            child: SizedBox(
              width: 102.h,
              child: Divider(),
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnEmail(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 3.h),
      padding: EdgeInsets.symmetric(horizontal: 14.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.h),
            child: Text(
              "Email",
              style: theme.textTheme.titleSmall,
            ),
          ),
          SizedBox(height: 10.v),
          Padding(
            padding: EdgeInsets.only(left: 9.h),
            child: CustomTextFormField(
              controller: emailController,
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnPassword(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 3.h),
      padding: EdgeInsets.symmetric(horizontal: 14.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.h),
            child: Text(
              "Password",
              style: theme.textTheme.titleSmall,
            ),
          ),
          SizedBox(height: 9.v),
          Padding(
            padding: EdgeInsets.only(left: 9.h),
            child: CustomTextFormField(
              controller: passwordController,
              textInputAction: TextInputAction.done,
              obscureText: true,
            ),
          )
        ],
      ),
    );
  }
}
