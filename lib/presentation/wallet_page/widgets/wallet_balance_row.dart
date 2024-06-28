import 'package:application/core/app_export.dart';
import 'package:flutter/material.dart';

class WalletBalanceRow extends StatelessWidget {
  final String image;
  final String text;
  final String text1;
  WalletBalanceRow({
    Key? key,
    required this.image,
    required this.text,
    required this.text1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          CustomImageView(
            imagePath: image,
            height: 30.v,
            width: 32.h,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 4.h,
              top: 5.v,
              bottom: 4.v,
            ),
            child: Text(
              text,
              style: theme.textTheme.bodyMedium!.copyWith(
                color: theme.colorScheme.onPrimaryContainer,
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(
              top: 5.v,
              bottom: 4.v,
            ),
            child: Text(
              text1,
              style: theme.textTheme.bodyMedium!.copyWith(
                color: theme.colorScheme.onPrimaryContainer,
              ),
            ),
          )
        ],
      ),
    );
  }
}
