import 'package:application/presentation/receive_screen/receive_screen.dart';
import 'package:application/presentation/transfer_screen/transfer_screen.dart';
import 'package:application/widgets/empty_record.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../model/history_transaction.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/transaction_record.dart';

class EthScreen extends StatelessWidget {
  EthScreen({Key? key}) : super(key: key);
  final List<HistoryTransaction> historyTransaction = [
    HistoryTransaction(
      id: "1",
      address: "0x1234567890",
      tokenID: "1234567890",
      sellerName: "Seller 1",
    ),
    HistoryTransaction(
      id: "2",
      address: "0x1234567890",
      tokenID: "1234567890",
      sellerName: "Seller 2",
    ),
    HistoryTransaction(
      id: "3",
      address: "0x1234567890",
      tokenID: "1234567890",
      sellerName: "Seller 3",
    ),
    HistoryTransaction(
      id: "4",
      address: "0x1234567890",
      tokenID: "1234567890",
      sellerName: "Seller 4",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              children: [
                _buildWalletActionsColumn(context),
                Visibility(
                    visible: historyTransaction.isEmpty, child: EmptyRecord()),
                ...historyTransaction
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TransactionRecord(
                          historyTransaction: e,
                        ),
                      ),
                    )
                    .toList(),
              ],
            ),
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
                    "ETH",
                    style: CustomTextStyles.bodyMediumPrimary,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 21.v),
          CustomImageView(
            imagePath: ImageConstant.imgEthereumSvgrepoCom,
            height: 25.v,
            width: 32.h,
            margin: EdgeInsets.only(left: 15.0),
          ),
          SizedBox(height: 26.v),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              "0 ETH",
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
                Spacer(flex: 53),
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
                Spacer(flex: 46),
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
