import 'package:application/presentation/receive_screen/receive_screen.dart';
import 'package:application/presentation/transfer_screen/transfer_screen.dart';
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
              _buildWalletActionsColumn(context),
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

  /// Section Widget
  Widget _buildWalletActionsColumn(BuildContext context) {
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
        children: [
          SizedBox(height: 28.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 2.v),
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
                    left: 145.h,
                    top: 11.v,
                  ),
                  child: Text(
                    "BNB",
                    style: CustomTextStyles.bodyMediumPrimary,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 21.v),
          CustomImageView(
            imagePath: ImageConstant.imgBinanceCoinBnb,
            height: 25.v,
            width: 32.h,
            margin: EdgeInsets.only(left: 15.0),
          ),
          SizedBox(height: 26.v),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              "0 BNB",
              style: CustomTextStyles.bodyMediumPrimary,
              textAlign: TextAlign.right,
            ),
          ),
          SizedBox(height: 40.v),
          Padding(
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReceiveScreen()),
                        );
                      },
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
                        decoration: IconButtonStyleHelper.fillIndigo,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TransferScreen()),
                          );
                        },
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
                      decoration: IconButtonStyleHelper.fillIndigo,
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
  onTapBtnArrowleftone(BuildContext context) {
    Navigator.pop(context);
  }
}
