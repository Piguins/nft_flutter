import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart'; // ignore_for_file: must_be_immutable

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 70.0),
          width: double.maxFinite,
          decoration: AppDecoration.fillOnPrimary,
          child: Column(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgEllipse10,
                height: 90.adaptSize,
                width: 90.adaptSize,
                radius: BorderRadius.circular(
                  45.h,
                ),
              ),
              SizedBox(height: 25.v),
              Text(
                "Mohamet Salah",
                style: CustomTextStyles.titleSmallOnPrimaryContainer15,
              ),
              SizedBox(height: 24.v),
              CustomElevatedButton(
                margin: EdgeInsets.only(left: 15.0),
                width: 185.h,
                text: "Edit Profile",
              ),
              SizedBox(height: 74.v),
              _buildRowArrowRight(context),
              SizedBox(height: 25.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 51.h,
                  right: 35.h,
                ),
                child: _buildChangPasswordSvgRepo(
                  context,
                  historyText: "Change Password",
                ),
              ),
              SizedBox(height: 25.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 51.h,
                  right: 35.h,
                ),
                child: _buildRowHistorySvgRepo(
                  context,
                  historyText: "See History Auction",
                ),
              ),
              SizedBox(height: 47.v),
              Divider(
                color: appTheme.gray700,
              ),
              SizedBox(height: 34.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 51.h,
                  right: 35.h,
                ),
                child: _buildTermOfUseSvgRepo(
                  context,
                  historyText: "Term of Use",
                ),
              ),
              SizedBox(height: 25.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 51.h),
                  child: Row(
                    children: [
                      CustomIconButton(
                        height: 35.adaptSize,
                        width: 35.adaptSize,
                        padding: EdgeInsets.all(5.h),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgLogoutSvgrepoCom,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 21.h,
                          top: 7.v,
                          bottom: 4.v,
                        ),
                        child: Text(
                          "Logout",
                          style: CustomTextStyles.bodyMedium15,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5.v)
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildRowArrowRight(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 51.h,
        right: 35.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 109.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconButton(
                  height: 35.adaptSize,
                  width: 35.adaptSize,
                  padding: EdgeInsets.all(5.h),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgBrightness,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                      top: 6.v,
                      bottom: 5.v,
                    ),
                    child: Text(
                      "Setting",
                      style: CustomTextStyles.bodyMedium15.copyWith(
                        fontSize: 14.0, // Thay đổi kích thước font ở đây
                      ),
                    ))
              ],
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgArrowRight,
            height: 24.adaptSize,
            width: 24.adaptSize,
            margin: EdgeInsets.only(
              top: 6.v,
              bottom: 5.v,
            ),
          )
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildRowHistorySvgRepo(
    BuildContext context, {
    required String historyText,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomIconButton(
          height: 35.adaptSize,
          width: 35.adaptSize,
          padding: EdgeInsets.all(5.h),
          child: CustomImageView(
            imagePath: ImageConstant.imgHistorySvgrepoCom,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 21.h,
            top: 6.v,
            bottom: 5.v,
          ),
          child: Text(
            historyText,
            style: CustomTextStyles.bodyMedium15.copyWith(
              color: theme.colorScheme.onPrimaryContainer,
            ),
          ),
        ),
        Spacer(),
        CustomImageView(
          imagePath: ImageConstant.imgArrowRight,
          height: 24.adaptSize,
          width: 24.adaptSize,
          margin: EdgeInsets.only(
            top: 5.v,
            bottom: 6.v,
          ),
        )
      ],
    );
  }

  Widget _buildChangPasswordSvgRepo(
    BuildContext context, {
    required String historyText,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      CustomIconButton(
        height: 35.adaptSize,
        width: 35.adaptSize,
        padding: EdgeInsets.all(5.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgSecureShieldP,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
          left: 21.h,
          top: 6.v,
          bottom: 5.v,
        ),
        child: Text(
          historyText,
          style: CustomTextStyles.bodyMedium15.copyWith(
            color: theme.colorScheme.onPrimaryContainer,
          ),
        ),
      ),
      Spacer(),
      CustomImageView(
        imagePath: ImageConstant.imgArrowRight,
        height: 24.adaptSize,
        width: 24.adaptSize,
        margin: EdgeInsets.only(
          top: 5.v,
          bottom: 6.v,
        ),
      )
    ]);
  }

  Widget _buildTermOfUseSvgRepo(
    BuildContext context, {
    required String historyText,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      CustomIconButton(
        height: 35.adaptSize,
        width: 35.adaptSize,
        padding: EdgeInsets.all(5.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgLawSvgrepoCom,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
          left: 21.h,
          top: 6.v,
          bottom: 5.v,
        ),
        child: Text(
          historyText,
          style: CustomTextStyles.bodyMedium15.copyWith(
            color: theme.colorScheme.onPrimaryContainer,
          ),
        ),
      ),
      Spacer(),
      CustomImageView(
        imagePath: ImageConstant.imgArrowRight,
        height: 24.adaptSize,
        width: 24.adaptSize,
        margin: EdgeInsets.only(
          top: 5.v,
          bottom: 6.v,
        ),
      )
    ]);
  }
}
