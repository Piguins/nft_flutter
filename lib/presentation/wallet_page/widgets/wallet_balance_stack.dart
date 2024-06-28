import 'package:application/presentation/wallet_page/widgets/wallet_balance_row.dart';
import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../bnb_screen/bnb_screen.dart';
import '../../eth_screen/eth_screen.dart';

class WalletBalanceStack extends StatefulWidget {
  Function onEthTap;
  Function onBnbTap;

  WalletBalanceStack({
    required this.onEthTap,
    required this.onBnbTap,
  });
  @override
  State<WalletBalanceStack> createState() => _WalletBalanceStackState();
}

class _WalletBalanceStackState extends State<WalletBalanceStack> {
  /// Common widget

  @override
  Widget build(BuildContext context) {
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
                      widget.onBnbTap();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 18.h),
                      child: WalletBalanceRow(
                        image: ImageConstant.imgBinanceCoinBnb,
                        text: "BNB",
                        text1: '${5}',
                      ),
                    ),
                  ),
                  SizedBox(height: 60.v),
                  GestureDetector(
                    onTap: () {
                      widget.onEthTap();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 18.h),
                      child: WalletBalanceRow(
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
}
