import 'package:application/core/utils/prefrence_variable.dart';
import 'package:application/presentation/wallet_page/widgets/emty_order.dart';
import 'package:application/presentation/wallet_page/widgets/wallet_balance_stack.dart';
import 'package:application/presentation/wallet_page/widgets/wallet_detail_section.dart';
import 'package:application/service/wallet_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/app_export.dart';
import '../bnb_screen/bnb_screen.dart';
import '../eth_screen/eth_screen.dart';
import 'widgets/order_item.dart';
import 'widgets/order_item_sell_dialog.dart'; // ignore_for_file: must_be_immutable

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

  bool _isWalletEmpty = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: FutureBuilder<bool>(future: () async {
            try {
              preferences = await SharedPreferences.getInstance();
              address =
                  preferences.getString(PreferenceVariable.WALLET_ADDRESS);
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
                  WalletDetailSection(
                    addressText: address,
                  ),
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
                  WalletBalanceStack(
                    onBnbTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BnbScreen(),
                        ),
                      );
                    },
                    onEthTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EthScreen()),
                      );
                    },
                  ),
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
                  _isWalletEmpty
                      ? EmptyOrder()
                      : Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 15.0,
                              mainAxisSpacing: 15.0,
                              childAspectRatio: 0.85,
                            ),
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) {
                              return OrderItem(
                                  id: index.toString(),
                                  imagePath: ImageConstant.imgShoe,
                                  address: ((index + 1) * 1000).toString(),
                                  onTap: (id) {
                                    // Show popup with item details
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return OrderItemSellDialog(
                                            id: id,
                                            imagePath: ImageConstant.imgShoe,
                                            address:
                                                ((index + 1) * 1000).toString(),
                                            onTap: (id) {
                                              // Do something
                                            },
                                          );
                                        });
                                  });
                            },
                          ),
                        ),
                  SizedBox(height: 5.v)
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  double getConvertCoin(int input) {
    double result = input / 1e18;
    String resultString = result.toStringAsFixed(5);
    return double.parse(resultString);
  }
}
