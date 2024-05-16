import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart'; 

class TransferScreen extends StatelessWidget {
  TransferScreen({Key? key})
      : super(
          key: key,
        );
  TextEditingController addressController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
 @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Container(
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
              SizedBox(height: 45.v),
              Padding(
                padding: EdgeInsets.only(right: 7.h),
                child: CustomTextFormField(
                  controller: descriptionController,
                  hintText:
                      "The network you have selected. Pleae ensure that the withdrawal suppports network. You will lose your assets if the chossen platform does not support retrievals ",
                  textInputAction: TextInputAction.done,
                  maxLines: 3,
                  borderDecoration: TextFormFieldStyleHelper.fillBlueGrayTL121,
                  fillColor: appTheme.blueGray90002,
                ),
              ),
 Spacer(
                flex: 37,
              ),
              CustomElevatedButton(
                width: 199.h,
                text: "Confirm",
              ),
              Spacer(
                flex: 62,
              )
            ],
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
        margin: EdgeInsets.fromLTRB(35.h, 12.v, 363.h, 12.v),
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
                imagePath: ImageConstant.imgSettings,
                height: 24.adaptSize,
                width: 24.adaptSize,
              ),
            ),
  suffixConstraints: BoxConstraints(
              maxHeight: 40.v,
            ),
          )
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
          )
        ],
      ),
    );
  }
  /// Navigates back to the previous screen.
  onTapArrowleftone(BuildContext context) {
    Navigator.pop(context);
  }
}


