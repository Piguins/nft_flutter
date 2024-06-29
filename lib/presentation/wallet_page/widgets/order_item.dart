import 'package:application/core/utils/image_constant.dart';
import 'package:application/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OrderItem extends StatelessWidget {
  final String id;
  final String imagePath;
  final String address;
  final String addressText;

  final Function(String,String,String) onTap;
  OrderItem({
    Key? key,
    required this.id,
    required this.imagePath,
    required this.address,
    required this.onTap,
    required this.addressText,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     bool isNetworkImage = imagePath.startsWith('http://') || imagePath.startsWith('https://');

    return GestureDetector(
      onTap: () => onTap(id,address,imagePath),
      child: Card(
        color: ColorSchemes.lightCodeColorScheme.primaryContainer,
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
                  ),
                  !isNetworkImage? Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ):Image.network(
                  imagePath,
                  fit: BoxFit.cover,
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 19.0, vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Address: $addressText",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      )),
                  Text("Token ID: $id",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
