import 'dart:collection';

import 'package:application/core/utils/prefrence_variable.dart';
import 'package:application/model/marketplace.dart';
import 'package:application/presentation/wallet_page/screens/no_wallet_page.dart';
import 'package:application/presentation/wallet_page/widgets/emty_order.dart';
import 'package:application/presentation/wallet_page/widgets/wallet_balance_stack.dart';
import 'package:application/presentation/wallet_page/widgets/wallet_detail_section.dart';
import 'package:application/service/auth_service.dart';
import 'package:application/service/marketplace_service.dart';
import 'package:application/service/nft_service.dart';
import 'package:application/service/wallet_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
 List<HashMap<String,dynamic>> ? data;
  late NFTService nftService;
  bool isLoading = false;
  Future<void> getBalanceWallet() async {}
  late SharedPreferences preferences;
  late MarketplaceService marketplaceService;
  String? address;
  String? addressText;
  @override
  void initState() {
    super.initState();
    nftService = NFTService();
    marketplaceService = MarketplaceService();
     getAddress();
  }
  Future<void> getNFTMarketplace() async{
    try{
      dynamic dataGet =  await nftService.getNFTByAddress(address!);
      HashMap<String,dynamic> dataTemp = convertToHashMap(dataGet);
       this.data = convertToListOfHashMaps(dataTemp["data"]);
    }
    catch(e){
      print('Error: $e');
    }
    finally{
      setState(() {
        isLoading = true;
      });
    }
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
  HashMap<String, dynamic> convertToHashMap(dynamic input) {
    if (input is Map<String, dynamic>) {
      return HashMap<String, dynamic>.from(input);
    } else {
      throw Exception('Input is not a Map<String, dynamic>');
    }
  }

  Future<void> getAddress() async{
    preferences = await SharedPreferences.getInstance();
    address =preferences.getString(PreferenceVariable.WALLET_ADDRESS);
    await getNFTMarketplace();

  }

  var walletStreaming =
      WalletService().getStreamAuctionById(AuthService.user!.uid, 'bsc');
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
    child:  
    !isLoading ? Center(
                  child: CircularProgressIndicator(),
                ):Scaffold(
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
            if (!data) {
              return NoWalletPage();
            }
            return Container(
              width: double.maxFinite,
              decoration: AppDecoration.fillOnPrimary,
              child: Column(
                children: [
                  WalletDetailSection(
                    addressText: addressText,
                    walletStreaming: walletStreaming,
                    address: address,
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
                          builder: (context) => BnbScreen(coin: "0.285"),
                        ),
                      );
                    },
                    onEthTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EthScreen()),
                      );
                    },
                    walletStreaming: walletStreaming,
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
                            itemCount: this.data !=null ? this.data!.length: 0,
                            itemBuilder: (BuildContext context, int index) {
                              return OrderItem(
                                  id: this.data![index]["tokenId"],
                                  imagePath: this.data![index]["metadata"]!=null ?  this.data![index]["metadata"]["image"] ?? ImageConstant.imageNoImage :  ImageConstant.imageNoImage,
                                  address: this.data![index]["tokenAddress"],
                                  addressText: truncateWithEllipsis(this.data![index]["tokenAddress"], 15) ,
                                  onTap: (id,address,imagePath) {
                                    // Show popup with item details
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return OrderItemSellDialog(
                                            id: id,
                                            imagePath: imagePath,
                                            address:
                                                address,
                                            addressText: truncateWithEllipsis(address, 10),
                                            onTap: (id,address, price)async {
                                              // Do something
                                              try{
                                              Marketplace marketplace = Marketplace(chain: "bsc", isSold: false, nftAddress: address, price: (double.parse(price) * 1e18).toInt().toString(), seller: this.address, tokenId: int.parse(id), marketplaceId: null);
                                              //print("marketplace ${marketplace1.toJson()}");
                                             await marketplaceService.MakeAnItemInMarketplace(marketplace);
                                        await getNFTMarketplace();
                                                              Fluttertoast.showToast(
                                            msg: "Sell NFT Success",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Color.fromARGB(255, 47, 242, 76),
                                            textColor: Colors.white,
                                            fontSize: 16.0
                                        );
                                              }
                                              catch(e){
                                                print("error: ${e.toString()}");
                                            Fluttertoast.showToast(
                                            msg: "failed",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0
                                        );
                                              }
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
