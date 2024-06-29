import 'dart:collection';

import 'package:application/core/utils/prefrence_variable.dart';
import 'package:application/model/marketplace.dart';
import 'package:application/presentation/receive_screen/receive_screen.dart';
import 'package:application/presentation/transfer_screen/transfer_screen.dart';
import 'package:application/service/marketplace_service.dart';
import 'package:application/widgets/empty_record.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/app_export.dart';
import '../../model/history_transaction.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/transaction_record.dart';

class BnbScreen extends StatefulWidget {
  BnbScreen({Key? key, required this.coin}) : super(key: key);
  final String coin;

  @override
  State<BnbScreen> createState() => _BnbScreenState();
}

class _BnbScreenState extends State<BnbScreen> {
  final List<HistoryTransaction> historyTransactions = [];
  MarketplaceService marketplaceService = MarketplaceService();
  @override
  void initState(){
    super.initState();
    getHistory();
  }
  Future<void> getHistory() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var dataRes = await marketplaceService.getHistory(sharedPreferences.getString(PreferenceVariable.WALLET_ADDRESS)!);
    print(dataRes);
    List<HashMap<String, dynamic>> tempData = convertToListOfHashMaps(dataRes);
    for(int i =0 ;i<tempData.length;i++){
      HashMap<String, dynamic> item = tempData[i];
      HistoryTransaction historyTransaction = HistoryTransaction(id: item["id"], address: item["nftAddress"], tokenID: item["tokenID"], sellerName: item["seller"]);
        historyTransactions.add(historyTransaction);
    }
    setState(() {
      
    });
  }
    List<HashMap<String, dynamic>> convertToListOfHashMaps(dynamic input) {
    if (input is List) {
      return input.map((item) {
        if (item is Map<String, dynamic>) {
          return HashMap<String, dynamic>.from(item);
        } else {
          throw Exception('Item is not a Map<String, dynamic>: $item');
        }
      }).toList();
    } else {
      throw Exception('Input is not a List');
    }
  }
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
                    visible: historyTransactions.isEmpty, child: EmptyRecord()),
                ...historyTransactions
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
              "${widget.coin} BNB",
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