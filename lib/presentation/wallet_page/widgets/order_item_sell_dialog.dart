import 'package:application/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../widgets/custom_search_view.dart';
import 'amount_input.dart';
import 'text_row.dart';

class OrderItemSellDialog extends StatelessWidget {
  final String id;
  final String imagePath;
  final String address;
  final Function(String) onTap;
  OrderItemSellDialog({
    Key? key,
    required this.id,
    required this.imagePath,
    required this.address,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: 400,
        child: Card(
          color: ColorSchemes.lightCodeColorScheme.onPrimary,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      ImageConstant.imgEllipse,
                      fit: BoxFit.cover,
                      height: 150,
                    ),
                    Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                      height: 200,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextRow(
                      text1: "Token ID: ",
                      text2: id,
                    ),
                    SizedBox(height: 10),
                    TextRow(
                      text1: "Address: ",
                      text2: address,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Cost",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(child: AmountInput()),
                        SvgPicture.asset(
                          ImageConstant.imgBinanceCoin,
                          height: 30,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 37, vertical: 10),
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 37, vertical: 10),
                        child: Text(
                          "Sell",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
