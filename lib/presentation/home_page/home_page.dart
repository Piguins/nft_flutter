import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_trailing_circleimage.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/custom_search_view.dart';
import 'widgets/homelist_item_widget.dart'; // ignore_for_file: must_be_immutable
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
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 16.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 39.h,
                    right: 43.h,
                  ),
                  child: CustomSearchView(
                    controller: searchController,
                    hintText: "Search items",
                    alignment: Alignment.center,
                  ),
                ),
              ),
              SizedBox(height: 40.v),
              Padding(
                padding: EdgeInsets.only(left: 42.h),
                child: Row(
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
                      buttonStyle: CustomButtonStyles.outlineOnError,
                      buttonTextStyle: theme.textTheme.titleMedium!,
                    )
                  ],
                ),
              ),
              SizedBox(height: 40.v),
              _buildStackFatBrides(context),
              SizedBox(height: 26.v),
              Padding(
                padding: EdgeInsets.only(left: 54.h),
                child: Text(
                  "Explore",
                  style: theme.textTheme.headlineSmall,
                ),
              ),
              SizedBox(height: 20.v),
              _buildHomeList(context)
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 50.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgMegaphone,
        margin: EdgeInsets.only(
          left: 25.h,
          top: 17.v,
          bottom: 18.v,
        ),
      ),
      actions: [
        AppbarTrailingCircleimage(
          imagePath: ImageConstant.imgRectangle5,
          margin: EdgeInsets.symmetric(
            horizontal: 27.h,
            vertical: 12.v,
          ),
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildStackFatBrides(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
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
                      buttonStyle: CustomButtonStyles.fillPrimaryTL15,
                      buttonTextStyle: theme.textTheme.titleSmall!,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildHomeList(BuildContext context) {
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
            return HomelistItemWidget();
          },
        ),
      ),
    );
  }
}
