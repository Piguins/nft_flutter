import 'package:application/core/utils/size_utils.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/image_constant.dart';
import '../../../theme/custom_text_style.dart';
import '../../../widgets/custom_image_view.dart';

class EmptyOrder extends StatelessWidget {
  const EmptyOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgBoxSvgrepoCom,
          height: 50.adaptSize,
          width: 50.adaptSize,
        ),
        SizedBox(height: 34.v),
        Text(
          "No NFT Owned, please buy some",
          style: CustomTextStyles.titleSmallBluegray90002,
        ),
      ],
    );
  }
}
