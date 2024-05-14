import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key})
      : super(
          key: key,
        );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 30.h,
            vertical: 43.v,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgDiamond1,
                      height: 25.v,
                      width: 32.h,
                      margin: EdgeInsets.only(
                        top: 1.v,
                        bottom: 3.v,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.h),
                      child: Text(
                        "NFT",
                        style: theme.textTheme.titleLarge,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 61.v),
              Text(
                "Collect ",
                style: theme.textTheme.displayMedium,
              ),
              SizedBox(height: 5.v),
              Text(
                "digital arts",
                style: theme.textTheme.displayMedium,
              ),
              SizedBox(height: 52.v),
              CustomImageView(
                imagePath: ImageConstant.imgEllipse1,
                height: 250.adaptSize,
                width: 250.adaptSize,
                radius: BorderRadius.circular(
                  125.h,
                ),
              ),
              SizedBox(height: 57.v),
              SizedBox(
                width: 248.h,
                child: Text(
                  "NFT is the world first\n  and largest Marketplace",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleLarge,
                ),
              ),
              SizedBox(height: 72.v),
              CustomElevatedButton(
                text: "Let’s get startes",
                margin: EdgeInsets.symmetric(horizontal: 40.h),
                buttonStyle: CustomButtonStyles.fillPrimary,
                buttonTextStyle: CustomTextStyles.titleLargeBlack900,
                onPressed: () {
                  onTapLetsget(context);
                },
              ),
              SizedBox(height: 5.v)
            ],
          ),
        ),
      ),
    );
  }

  /// Navigates to the homeContainerScreen when the action is triggered.
  onTapLetsget(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homeContainerScreen);
  }
}
