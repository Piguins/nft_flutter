import 'package:application/core/app_export.dart';
import 'package:flutter/material.dart';

import '../core/utils/image_constant.dart';
import 'custom_image_view.dart';

class EmptyRecord extends StatelessWidget {
  const EmptyRecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50.h),
      height: 250,
      child: Column(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgBoxSvgrepoCom,
            height: 50.adaptSize,
            width: 50.adaptSize,
          ),
          SizedBox(height: 28.v),
          Text(
            "No transaction record",
            style: CustomTextStyles.titleSmallBluegray90002,
          ),
          Spacer(
            flex: 68,
          )
        ],
      ),
    );
  }
}
