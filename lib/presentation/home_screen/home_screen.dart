import 'dart:collection';

import 'package:application/core/utils/image_constant.dart';
import 'package:application/core/utils/size_utils.dart';
import 'package:application/model/marketplace.dart';
import 'package:application/presentation/home_screen/ItemCard.dart';
import 'package:application/presentation/home_screen/ItemDetailPopup.dart';
import 'package:application/service/marketplace_service.dart';
import 'package:application/service/nft_service.dart';
import 'package:application/theme/theme_helper.dart';
import 'package:application/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late NFTService nftService ;
  late MarketplaceService marketplaceService;
  late List<HashMap<String,dynamic>> data;
  bool isLoading = false;
  @override 
  void initState(){
    super.initState();
   nftService = NFTService();
   marketplaceService = MarketplaceService();
   getNFTMarketplace();
  }
  Future<void> getNFTMarketplace() async{
    nftService.getNFTInMarketplacce();
    try{
      dynamic dataGet = await nftService.getNFTInMarketplacce();
      HashMap<String,dynamic> dataTemp = convertToHashMap(dataGet);
       data = convertToListOfHashMaps(dataTemp["data"]);
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child:
       !isLoading 
              ? Center(
                  child: CircularProgressIndicator(),
                ):
       Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            child:
                 Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25.0, top: 25.0),
                  child: Text(
                    "Explore",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                SizedBox(height: 25.0),
                Padding(
                  padding: EdgeInsets.only(
                    left: 25.h,
                    right: 25.h,
                  ),
                  child: CustomSearchView(
                    // controller: searchController,
                    hintText: "Search items",
                  ),
                ),
                SizedBox(height: 26.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15.0,
                      mainAxisSpacing: 15.0,
                      childAspectRatio: 0.85,
                    ),
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Itemcard(
                          id: index.toString(),
                          imagePath: data[index]["image"] ?? ImageConstant.imgShoe,
                          price: (data[index]["price"] / 1000000000000000000).toString(),
                          onTap: (id) {
                            // Show popup with item details
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return ItemDetailPopup(
                                    id: id,
                                    imagePath: ImageConstant.imgShoe,
                                    price: (data[index]["price"] / 1000000000000000000).toString(),
                                    onTap: (id) async{
                                      // Do something
                                      try{
                                        Marketplace marketplace = Marketplace(chain: 'bsc', isSold: false, nftAddress: data[index]["tokenAddress"],
                                         price: data[index]["price"].toString(), seller: data[index]["seller"],itemId: data[index]["itemId"], tokenId: int.parse(data[index]["tokenId"]),marketplaceId: data[index]["marketplaceId"]);
                                        await marketplaceService.PurchaseItem(marketplace);
                                        await getNFTMarketplace();
                                          Fluttertoast.showToast(
                                            msg: "Buy NFT Success",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Color.fromARGB(255, 47, 242, 76),
                                            textColor: Colors.white,
                                            fontSize: 16.0
                                        );
                                        setState(() {
                                          
                                        });
                                      }
                                      catch(e){
                                        Fluttertoast.showToast(
                                            msg: e.toString(),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
