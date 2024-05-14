import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/custom_search_view.dart';
import 'widgets/home_item_widget.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
// ignore_for_file: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key})
      : super(
          key: key,
        );
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillOnPrimary,
          child: Column(
            children: [
              SizedBox(height: 4.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 39.h,
                  right: 43.h,
                ),
                child: CustomSearchView(
                  controller: searchController,
                  hintText: "Search items",
                ),
              ),
              SizedBox(height: 40.v),
              _buildRowpopular(context),
              SizedBox(height: 40.v),
              _buildStackfatbrides(context),
              SizedBox(height: 26.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 54.h),
                  child: Text(
                    "Explore",
                    style: theme.textTheme.headlineSmall,
                  ),
                ),
              ),
              SizedBox(height: 20.v),
              _buildHome(context)
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildRowpopular(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(left: 42.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomElevatedButton(
              height: 45.v,
              width: 140.h,
              text: "Popular",
              buttonStyle: CustomButtonStyles.fillPrimaryTL22,
              buttonTextStyle: CustomTextStyles.titleMediumBlack900,
            ),
            CustomOutlinedButton(
              width: 140.h,
              text: "Trending",
              margin: EdgeInsets.only(left: 19.h),
              buttonStyle: CustomButtonStyles.outlineGray,
              buttonTextStyle: theme.textTheme.titleMedium!,
            ),
            Container(
              width: 140.h,
              margin: EdgeInsets.only(left: 19.h),
              padding: EdgeInsets.symmetric(
                horizontal: 30.h,
                vertical: 8.v,
              ),
              decoration: AppDecoration.outlineGray.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder22,
              ),
              child: Text(
                "Arts",
                style: theme.textTheme.titleMedium,
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildStackfatbrides(BuildContext context) {
    return SizedBox(
      height: 280.v,
      width: 348.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgRectangle9,
            height: 280.v,
            width: 348.h,
            radius: BorderRadius.circular(
              15.h,
            ),
            alignment: Alignment.center,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(top: 227.v),
              padding: EdgeInsets.symmetric(
                horizontal: 14.h,
                vertical: 2.v,
              ),
              decoration: AppDecoration.fillSecondaryContainer.copyWith(
                borderRadius: BorderRadiusStyle.customBorderBL15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 4.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Fatbrides",
                          style: CustomTextStyles.titleSmallSemiBold,
                        ),
                        SizedBox(height: 1.v),
                        Text(
                          "23.0 ETH",
                          style: CustomTextStyles.titleSmallPrimary,
                        )
                      ],
                    ),
                  ),
                  CustomElevatedButton(
                    height: 31.v,
                    width: 120.h,
                    text: "Place a bid",
                    margin: EdgeInsets.symmetric(vertical: 8.v),
                    buttonTextStyle: theme.textTheme.titleSmall!,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildHome(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        height: 152.v,
        child: ListView.separated(
          padding: EdgeInsets.only(left: 54.h),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 11.h,
            );
          },
          itemCount: 3,
          itemBuilder: (context, index) {
            return HomeItemWidget();
          },
        ),
      ),
    );
  }
}
