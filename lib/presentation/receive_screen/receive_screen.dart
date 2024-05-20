import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ReceiveScreen extends StatelessWidget {
  ReceiveScreen({Key? key})
      : super(
          key: key,
        );
  TextEditingController addressoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Container(
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
                text: "ETH",
                buttonStyle: CustomButtonStyles.fillBlueGrayTL12,
                buttonTextStyle:
                    CustomTextStyles.titleSmallOnSecondaryContainer,
              ),
              SizedBox(height: 34.v),
              CustomTextFormField(
                controller: addressoneController,
                hintText: "13Ghuiasfj914Xi18i258Iyuegweg25235wgej",
                textInputAction: TextInputAction.done,
              ),
              Spacer(
                flex: 41,
              ),
              CustomElevatedButton(
                width: 199.h,
                text: "Copy Address",
              ),
              Spacer(
                flex: 58,
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

  /// Navigates back to the previous screen.
  onTapArrowleftone(BuildContext context) {
    Navigator.pop(context);
  }
}
