import 'dart:collection';
import 'dart:ffi';

import 'package:application/core/utils/prefrence_variable.dart';
import 'package:application/presentation/bnb_screen/bnb_screen.dart';
import 'package:application/presentation/eth_screen/eth_screen.dart';
import 'package:application/presentation/receive_screen/receive_screen.dart';
import 'package:application/presentation/transfer_screen/transfer_screen.dart';
import 'package:application/presentation/wallet_page/screens/no_wallet_page.dart';
import 'package:application/service/auth_service.dart';
import 'package:application/service/wallet_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3dart/web3dart.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart'; // ignore_for_file: must_be_immutable

class WalletPage extends StatefulWidget {
  bool? isWalletEmpty;
  WalletPage({
    Key? key,
    this.isWalletEmpty,
  }) : super(
          key: key,
        );

  @override
  State<WalletPage> createState() => _WalletPageState();
  double coin = 0;
}

class _WalletPageState extends State<WalletPage> {
  List<String> dropdownItemList = [
    "ETH",
    "BNB",
  ];
  @override
  void initState() {
    super.initState();
  }

  Future<void> getBalanceWallet() async {}
  late SharedPreferences preferences;
  String? address;
  String? addressText;
  Future<void> getAddress() async {
    preferences = await SharedPreferences.getInstance();
    address =
        "truncateWithEllipsis(preferences.getString(PreferenceVariable.WALLET_ADDRESS)!,10)";
  }

  // var walletStreaming =
  //     WalletService().getStreamAuctionById(AuthService.user!.uid, 'bsc');
  String truncateWithEllipsis(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    }
    return text.substring(0, maxLength) + '...';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<bool>(future: () async {
          try {
            preferences = await SharedPreferences.getInstance();
            address = preferences.getString(PreferenceVariable.WALLET_ADDRESS);
            if (address != null) {
              addressText = truncateWithEllipsis(address!, 10);
              WalletService walletService = WalletService();
              walletService.getBalanceWallet(address!, 'bsc');
            }
          } catch (e) {
            print(e);
          }
          return address != null;
        }(), builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error"),
            );
          }
          bool data = snapshot.data!;
          // if (!data) {
          //   return NoWalletPage();
          // }
          return Container(
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
          );
        }),
      ),
    );
  }

  double getConvertCoin(int input) {
    double result = input / 1e18;
    String resultString = result.toStringAsFixed(5);
    return double.parse(resultString);
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
          // Uncomment and modify this section to use StreamBuilder
          /*
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
        */
          Text(
            "0 BSC", // Replace this with the actual data if needed
            style: CustomTextStyles.bodyMediumPrimary,
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
                                      address: address,
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
                  // StreamBuilder<QuerySnapshot<Object?>>(
                  //   stream: walletStreaming, // Gọi stream
                  //   builder: (context, snapshot) {
                  //     if (snapshot.connectionState == ConnectionState.waiting) {
                  //       return CircularProgressIndicator();
                  //     } else if (snapshot.hasError) {
                  //       return Text("Lỗi: ${snapshot.error}");
                  //     } else if (snapshot.hasData) {
                  //       String stringData = (snapshot.data?.docs[0].data()
                  //           as Map<String, dynamic>)['numOfCoin'];
                  //       double data = getConvertCoin(int.parse(stringData));
                  //       return GestureDetector(
                  //         onTap: () {
                  //           Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => BnbScreen()),
                  //           );
                  //         },
                  //         child: Padding(
                  //           padding: EdgeInsets.only(right: 18.h),
                  //           child: _buildWalletEthBalanceRow(
                  //             context,
                  //             image: ImageConstant.imgBinanceCoinBnb,
                  //             text: "BNB",
                  //             text1: '${data}',
                  //           ),
                  //         ),
                  //       );
                  //     } else {
                  //       return Text("0 BSC");
                  //     }
                  //   },
                  // )
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
                        text1: '${5}',
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
                        text1: '0',
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
