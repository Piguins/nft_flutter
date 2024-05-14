import 'package:flutter/material.dart';
import '../../../core/app_export.dart'; // ignore: must_be_immutable

class HomeItemWidget extends StatelessWidget {
  const HomeItemWidget({Key? key})
      : super(
          key: key,
        );
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.h,
      child: Align(
        alignment: Alignment.centerRight,
        child: CustomImageView(
          imagePath: ImageConstant.imgRectangle9,
          height: 149.v,
          width: 150.h,
          radius: BorderRadius.circular(
            15.h,
          ),
          margin: EdgeInsets.only(top: 3.v),
        ),
      ),
    );
  }
}
