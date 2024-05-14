import 'package:application/presentation/bnb_screen/bnb_screen.dart';
import 'package:application/presentation/eth_screen/eth_screen.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
// ignore_for_file: must_be_immutable
class WalletPage extends StatelessWidget {
  WalletPage({Key? key})
      : super(
          key: key,
        );

  List<String> dropdownItemList = [
    "ETH",
    "BNB",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillOnPrimary,
          child: Column(
            children: [
              _buildWalletDetailsSection(context),
              SizedBox(height: 20.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 34.h),
                  child: Text(
                    "Wallet Account",
                    style: CustomTextStyles.bodyMediumPrimary,
                  ),
                ),
              ),
              SizedBox(height: 34.v),
              _buildWalletBalancesStack(context),
              SizedBox(height: 35.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 34.h),
                  child: Text(
                    "Owned NFTs",
                    style: CustomTextStyles.bodyMediumPrimary,
                  ),
                ),
              ),
              SizedBox(height: 49.v),
              CustomImageView(
                imagePath: ImageConstant.imgBoxSvgrepoCom,
                height: 50.adaptSize,
                width: 50.adaptSize,
              ),
              SizedBox(height: 34.v),
              Text(
                "No NFT Owned, please buy some",
                style: CustomTextStyles.titleSmallBluegray90002,
              ),
              SizedBox(height: 5.v)
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildWalletDetailsSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 56.h,
        vertical: 16.v,
      ),
      decoration: AppDecoration.gradientOnPrimaryToPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.customBorderBL30,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 34.v),
          CustomDropDown(
            width: 139.h,
            icon: Container(
              margin: EdgeInsets.symmetric(horizontal: 24.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgArrowdown,
                height: 18.adaptSize,
                width: 18.adaptSize,
              ),
            ),
            hintText: "ETH",
            contentPadding: EdgeInsets.only(left: 25.0),
            items: dropdownItemList,
          ),
          SizedBox(height: 28.v),
          Text(
            "0 ETH",
            style: CustomTextStyles.bodyMediumPrimary,
          ),
          SizedBox(height: 24.v),
          CustomElevatedButton(
            height: 45.v,
            width: 171.h,
            text: "13GUaKH...Mr8mM4i",
            buttonStyle: CustomButtonStyles.fillBlueGray,
            buttonTextStyle: theme.textTheme.bodyMedium!,
          ),
          SizedBox(height: 28.v),
          Padding(
            padding: EdgeInsets.only(right: 5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 2.v),
                  child: Column(
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
                      SizedBox(height: 8.v),
                      Text(
                        "Receive",
                        style: theme.textTheme.bodyMedium,
                      )
                    ],
                  ),
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

  /// Section Widget
  Widget _buildWalletBalancesStack(BuildContext context) {
    return SizedBox(
      height: 188.v,
      width: 349.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 19.h,
                vertical: 21.v,
              ),
              decoration: AppDecoration.outlineBlueGray.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder25,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BnbScreen()),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 18.h),
                      child: _buildWalletEthBalanceRow(
                        context,
                        image: ImageConstant.imgBinanceCoinBnb,
                        text: "BNB",
                        text1: "0",
                      ),
                    ),
                  ),
                  SizedBox(height: 60.v),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EthScreen()),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 18.h),
                      child: _buildWalletEthBalanceRow(
                        context,
                        image: ImageConstant.imgEthereumSvgrepoCom,
                        text: "ETH",
                        text1: "0",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 349.h,
              child: Divider(
                color: appTheme.blueGray90002,
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildWalletEthBalanceRow(
    BuildContext context, {
    required String image,
    required String text,
    required String text1,
  }) {
    return Row(
      children: [
        CustomImageView(
          imagePath: image,
          height: 30.v,
          width: 32.h,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 4.h,
            top: 5.v,
            bottom: 4.v,
          ),
          child: Text(
            text,
            style: theme.textTheme.bodyMedium!.copyWith(
              color: theme.colorScheme.onPrimaryContainer,
            ),
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.only(
            top: 5.v,
            bottom: 4.v,
          ),
          child: Text(
            text1,
            style: theme.textTheme.bodyMedium!.copyWith(
              color: theme.colorScheme.onPrimaryContainer,
            ),
          ),
        )
      ],
    );
  }
}
