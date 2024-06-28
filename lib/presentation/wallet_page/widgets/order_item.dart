import 'package:application/core/utils/image_constant.dart';
import 'package:application/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OrderItem extends StatelessWidget {
  final String id;
  final String imagePath;
  final String address;
  final Function(String) onTap;
  OrderItem({
    Key? key,
    required this.id,
    required this.imagePath,
    required this.address,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(id),
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
                  Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
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
                  Text("Address: $address",
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
