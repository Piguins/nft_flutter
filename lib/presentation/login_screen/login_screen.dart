import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/custom_text_form_field.dart'; // ignore_for_file: must_be_immutable

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
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
                onPressed: () =>
                    Navigator.pushNamed(context, AppRoutes.bnbScreen),
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
