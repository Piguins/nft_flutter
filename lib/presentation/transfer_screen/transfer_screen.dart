import 'package:application/core/utils/prefrence_variable.dart';
import 'package:application/service/wallet_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3dart/web3dart.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart'; // ignore_for_file: must_be_immutable

class TransferScreen extends StatefulWidget {
  TransferScreen({Key? key, })
      : super(
          key: key,
        );

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  TextEditingController addressController = TextEditingController();

  TextEditingController amountController = TextEditingController();

  WalletService walletService = WalletService();
  bool _isLoading = false;
  Future<void> transferMoney() async {
     bool result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Caution'),
          content: RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(text: 'Are you sure to transfer to this address '),
              TextSpan(text: '${addressController.text}', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
          actions: <Widget>[
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: Text('Yes'),
              onPressed: ()async {
                Navigator.of(context).pop(true);
                
              },
            ),
          ],
        );
      },
    );
    if(result){
      SharedPreferences preferences = await SharedPreferences.getInstance();
        try{
          if(isValidEthereumAddress(addressController.text))
          {
              print('address to ${addressController.text}');
              print('amount to ${amountController.text}');
              setState(() {
                _isLoading = true;
              });
              await walletService.transferMoney(preferences.getString(PreferenceVariable.WALLET_ADDRESS)!, addressController.text, double.parse(amountController.text));
              Fluttertoast.showToast(
              msg: "Transfer money success",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Color.fromARGB(255, 31, 89, 171),
              textColor: Colors.white,
              fontSize: 16.0
              );
            setState(() {
                _isLoading = false;
              });
          }
          else{
            Fluttertoast.showToast(
              msg: "Not valid address",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Color.fromARGB(255, 236, 109, 100),
              textColor: Colors.white,
              fontSize: 16.0
          );
        }
        }
        catch(e){
              Fluttertoast.showToast(
              msg: "Transfer coin address failed",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Color.fromARGB(255, 236, 109, 100),
              textColor: Colors.white,
              fontSize: 16.0
          );
                  setState(() {
                _isLoading = false;
              });
        }
        finally{
        }
    }
    
  }
    bool isValidEthereumAddress(String address) {
      try {
        EthereumAddress.fromHex(address);
        return true;
      } catch (e) {
        return false;
      }
    }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 38.h,
              vertical: 15.v,
            ),
            child: Column(
              children: [
                Text(
                  "SEND TO",
                  style: CustomTextStyles.titleLargeSemiBold,
                ),
                SizedBox(height: 19.v),
                CustomImageView(
                  imagePath: ImageConstant.imgBinanceCoinBnb,
                  height: 25.v,
                  width: 32.h,
                ),
                SizedBox(height: 42.v),
                _buildToAddressColumn(context),
                SizedBox(height: 28.v),
                _buildAmountColumn(context),
                SizedBox(height: 62.v),
                Container(
                  width: 308.h,
                  margin: EdgeInsets.only(
                    left: 17.h,
                    right: 28.h,
                  ),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              "The network you have selected. Please ensure that the withdrawal supports the network. You will ",
                          style: CustomTextStyles.bodySmallGray100,
                        ),
                        TextSpan(
                          text:
                              "lose your assets if the chosen platform does not support retrievals ",
                          style: CustomTextStyles.bodySmallOnError,
                        )
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 20.v), // Adjust as needed
                _isLoading
                ? CircularProgressIndicator()
                : CustomElevatedButton(
                    width: 199.h,
                    text: "Confirm",
                    onPressed: () => transferMoney(),
                          ),
                SizedBox(height: 20.v), // Adjust as needed
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: double.maxFinite,
      leading: AppbarLeadingIconbutton(
        imagePath: ImageConstant.imgArrowLeft,
        margin: EdgeInsets.fromLTRB(15.h, 25.v, 363.h, 12.v),
        onTap: () {
          onTapArrowleftone(context);
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildToAddressColumn(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 7.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 6.h),
            child: Text(
              "To Address",
              style: CustomTextStyles.bodyMediumLight,
            ),
          ),
          SizedBox(height: 12.v),
          CustomTextFormField(
            controller: addressController,
            suffix: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 30.h,
                vertical: 8.v,
              ),
              child: CustomImageView(
                imagePath: ImageConstant.imgThumbsup,
                height: 24.adaptSize,
                width: 24.adaptSize,
              ),
            ),
            suffixConstraints: BoxConstraints(
              maxHeight: 40.v,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildAmountColumn(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 7.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 6.h),
            child: Text(
              "Amount",
              style: CustomTextStyles.bodyMediumLight,
            ),
          ),
          SizedBox(height: 12.v),
          CustomTextFormField(
            controller: amountController,
            textInputAction: TextInputAction.done,
          ),
        ],
      ),
    );
  }

  /// Navigates back to the previous screen.
  onTapArrowleftone(BuildContext context) {
    Navigator.pop(context);
  }
}
