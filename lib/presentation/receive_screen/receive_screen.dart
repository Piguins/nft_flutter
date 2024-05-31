import 'package:application/core/utils/prefrence_variable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart'; // ignore_for_file: must_be_immutable

class ReceiveScreen extends StatefulWidget {
  ReceiveScreen({Key? key, this.address})
      : super(
          key: key,
        );
  String? address;

  @override
  State<ReceiveScreen> createState() => _ReceiveScreenState();
}

class _ReceiveScreenState extends State<ReceiveScreen> {
  TextEditingController addressoneController = TextEditingController();
  String? address;
  @override 
  void initState(){
    super.initState();
    getAddress();
  }
  Future<void> getAddress() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
    address = preferences.getString(PreferenceVariable.WALLET_ADDRESS);
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: address== null ? Center(
              child: CircularProgressIndicator(),
            ) : Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 41.h,
              vertical: 43.v,
            ),
            child: Column(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgQrcodeDefault1,
                  height: 180.adaptSize,
                  width: 180.adaptSize,
                  radius: BorderRadius.circular(
                    25.h,
                  ),
                ),
                SizedBox(height: 23.v),
                Text(
                  "Scan address to receive payment",
                  style: CustomTextStyles.bodyMediumLight,
                ),
                SizedBox(height: 18.v),
                Text(
                  "RECEIVE",
                  style: CustomTextStyles.titleSmallOnSecondaryContainer,
                ),
                SizedBox(height: 22.v),
                CustomElevatedButton(
                  height: 29.v,
                  width: 102.h,
                  text: "BNB",
                  buttonStyle: CustomButtonStyles.fillBlueGrayTL12,
                  buttonTextStyle:
                      CustomTextStyles.titleSmallOnSecondaryContainer,
                ),
                SizedBox(height: 34.v),
                CustomTextFormField(
                  controller: addressoneController,
                  hintText: widget.address != null ? widget.address: "13Ghuiasfj914Xi18i258Iyuegweg25235wgej",
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(height: 34.v), // Adjusted spacing
                CustomElevatedButton(
                  width: 199.h,
                  text: "Copy Address",
                  onPressed: () {
                    if(widget.address !=null){
                    Clipboard.setData(
                              ClipboardData(text: widget.address!));
                    }
                  },
                ),
                SizedBox(height: 34.v), // Adjusted spacing
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

  /// Navigates back to the previous screen.
  onTapArrowleftone(BuildContext context) {
    Navigator.pop(context);
  }
}
