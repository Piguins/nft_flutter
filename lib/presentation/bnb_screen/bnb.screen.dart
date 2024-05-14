import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_icon_button.dart';

class BnbScreen extends StatelessWidget {
  const BnbScreen({Key? key})
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
              Spacer(
                flex: 31,
              ),
              CustomImageView(
                imagePath: ImageConstant.imgBoxSvgrepoCom,
                height: 50.adaptSize,
                width: 50.adaptSize,
              ),
              SizedBox(height: 28.v),
              Text(
                "No transaction record",
                style: CustomTextStyles.titleSmallBluegray90002,
              ),
              Spacer(
                flex: 68,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildColumnarrowleft(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 35.h,
        vertical: 16.v,
      ),
      decoration: AppDecoration.gradientOnPrimaryToPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.customBorderBL30,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 28.v),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 101.v),
                child: CustomIconButton(
                  height: 32.adaptSize,
                  width: 32.adaptSize,
                  padding: EdgeInsets.all(7.h),
                  decoration: IconButtonStyleHelper.fillBlueGray,
                  onTap: () {
                    onTapBtnArrowleftone(context);
                  },
                  child: CustomImageView(
                    imagePath: ImageConstant.imgArrowLeft,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 132.h,
                  top: 11.v,
                ),
                child: Column(
                  children: [
                    Text(
                      "BNB",
                      style: CustomTextStyles.bodyMedium15,
                    ),
                    SizedBox(height: 21.v),
                    CustomImageView(
                      imagePath: ImageConstant.imgBinanceCoinBnb,
                      height: 25.v,
                      width: 32.h,
                    ),
                    SizedBox(height: 26.v),
                    Text(
                      "0 BNB",
                      style: theme.textTheme.bodyLarge,
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 40.v),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(
                left: 21.h,
                right: 26.h,
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
            ),
          )
        ],
      ),
    );
  }

  /// Navigates back to the previous screen.
  onTapBtnArrowleftone(BuildContext context) {
    Navigator.pop(context);
  }
}
