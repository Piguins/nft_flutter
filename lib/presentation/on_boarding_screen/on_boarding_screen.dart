import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
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
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 2.v),
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
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 248.h,
                  margin: EdgeInsets.only(right: 18.h),
                  child: Text(
                    "NFT is the world first\n  and largest Marketplace",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleLarge,
                  ),
                ),
              ),
              SizedBox(height: 72.v),
              CustomElevatedButton(
                width: 290.h,
                text: "Let’s get startes",
                buttonTextStyle: CustomTextStyles.titleLargeBlack900,
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 62.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgDiamond1,
        margin: EdgeInsets.only(
          left: 30.h,
          top: 14.v,
          bottom: 16.v,
        ),
      ),
      title: AppbarTitle(
        text: "NFT",
        margin: EdgeInsets.only(left: 15.h),
      ),
    );
  }
}
