import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_icon_button.dart';

class EthScreen extends StatelessWidget {
  const EthScreen({Key? key})
      : super(
          key: key,
        );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildColumnarrowleft(context),
              Container(
                padding: EdgeInsets.only(
                  left: 122.h,
                  top: 164.v,
                  right: 122.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgBoxSvgrepoCom,
                      height: 50.adaptSize,
                      width: 50.adaptSize,
                      margin: EdgeInsets.only(right: 63.h),
                    ),
                    SizedBox(height: 28.v),
                    Text(
                      "No transaction record",
                      style: CustomTextStyles.titleSmallBluegray90002,
                    ),
                    SizedBox(height: 5.v)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnarrowleft(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.v),
      decoration: AppDecoration.gradientOnPrimaryToPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.customBorderBL30,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 28.v),
          CustomAppBar(
            leadingWidth: 67.h,
            leading: AppbarLeadingIconbutton(
              imagePath: ImageConstant.imgArrowLeft,
              margin: EdgeInsets.only(
                left: 35.h,
                bottom: 2.v,
              ),
              onTap: () {
                onTapArrowleftone(context);
              },
            ),
            centerTitle: true,
            title: AppbarTitle(
              text: "ETH",
            ),
          ),
          SizedBox(height: 21.v),
          CustomImageView(
            imagePath: ImageConstant.imgEthereumSvgrepoCom,
            height: 32.v,
            width: 30.h,
          ),
          SizedBox(height: 19.v),
          Text(
            "0 ETH",
            style: theme.textTheme.bodyLarge,
          ),
          SizedBox(height: 40.v),
          Padding(
            padding: EdgeInsets.only(
              left: 56.h,
              right: 61.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CustomIconButton(
                      height: 35.adaptSize,
                      width: 35.adaptSize,
                      padding: EdgeInsets.all(4.h),
                      decoration: IconButtonStyleHelper.fillIndigo,
                      child: CustomImageView(
                        imagePath: ImageConstant.imgReceiveMoneySvgrepoCom,
                      ),
                    ),
                    SizedBox(height: 9.v),
                    Text(
                      "Receive",
                      style: theme.textTheme.bodyMedium,
                    )
                  ],
                ),
                Spacer(
                  flex: 53,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 2.v),
                  child: Column(
                    children: [
                      CustomIconButton(
                        height: 35.adaptSize,
                        width: 35.adaptSize,
                        padding: EdgeInsets.all(4.h),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgMoneySendSvgrepoCom,
                        ),
                      ),
                      SizedBox(height: 8.v),
                      Text(
                        "Transfer",
                        style: theme.textTheme.bodyMedium,
                      )
                    ],
                  ),
                ),
                Spacer(
                  flex: 46,
                ),
                Column(
                  children: [
                    CustomIconButton(
                      height: 35.adaptSize,
                      width: 35.adaptSize,
                      padding: EdgeInsets.all(4.h),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgTransfer3SvgrepoCom,
                      ),
                    ),
                    SizedBox(height: 11.v),
                    Text(
                      "Swap",
                      style: theme.textTheme.bodyMedium,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Navigates back to the previous screen.
  onTapArrowleftone(BuildContext context) {
    Navigator.pop(context);
  }
}
