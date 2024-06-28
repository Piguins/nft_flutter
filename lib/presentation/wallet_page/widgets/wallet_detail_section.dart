import 'package:application/core/app_export.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../theme/custom_button_style.dart';
import '../../../widgets/custom_drop_down.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_icon_button.dart';
import '../../receive_screen/receive_screen.dart';
import '../../transfer_screen/transfer_screen.dart';

class WalletDetailSection extends StatelessWidget {
  final String? addressText;
  final String? address;

  Stream<QuerySnapshot<Object?>> walletStreaming;
  WalletDetailSection({Key? key, this.addressText, required this.walletStreaming, this.address}) : super(key: key);
  final List<String> dropdownItemList = [
    "ETH",
    "BNB",
  ];
    double getConvertCoin(int input) {
    double result = input / 1e18;
    String resultString = result.toStringAsFixed(5);
    return double.parse(resultString);
  }
  @override
  Widget build(BuildContext context) {
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
          // Uncomment and modify this section to use StreamBuilder
          
        StreamBuilder<QuerySnapshot<Object?>>(
          stream: walletStreaming, // Gọi stream
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading...");
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else if (snapshot.hasData) {
              String stringData = (snapshot.data?.docs[0].data()
                  as Map<String, dynamic>)['numOfCoin'];
              double data = getConvertCoin(int.parse(stringData));
              return Text(
                "${data} BSC",
                style: CustomTextStyles.bodyMediumPrimary,
              );
            } else {
              return Text("0 BSC");
            }
          },
        ),
        

          SizedBox(height: 24.v),
          CustomElevatedButton(
            height: 45.v,
            width: 171.h,
            text: addressText ?? '0x12321321',
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
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReceiveScreen(
                                      address: this.address,
                                    )),
                          );
                        },
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
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TransferScreen(),
                              ));
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
}
