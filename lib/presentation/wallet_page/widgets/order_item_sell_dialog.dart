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
  final String addressText;

  final Function(String, String,String) onTap;
  TextEditingController controller = TextEditingController();
  OrderItemSellDialog({
    Key? key,
    required this.id,
    required this.imagePath,
    required this.address,
    required this.addressText,

    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     bool isNetworkImage = imagePath.startsWith('http://') || imagePath.startsWith('https://');

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
                       !isNetworkImage? Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    height: 200,
                  ):Image.network(
                  imagePath,
                  fit: BoxFit.cover,
                  height: 200,
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    }
                  },
                  errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                    return Text('Failed to load image');
                  },
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
                      text2: addressText,
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
                        Expanded(child: AmountInput(controller: controller,)),
                        SvgPicture.asset(
                          ImageConstant.imgBinanceCoin,
                          height: 25,
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
                      onPressed: ()async {
                        await onTap(id,address,controller.text);
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
