import 'package:application/core/utils/image_constant.dart';
import 'package:application/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Itemcard extends StatelessWidget {
  final String id;
  final String imagePath;
  final String price;
  final Function(String) onTap;
  Itemcard({
    Key? key,
    required this.id,
    required this.imagePath,
    required this.price,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     bool isNetworkImage = imagePath.startsWith('http://') || imagePath.startsWith('https://');
    return Card(
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
                !isNetworkImage ? Image.asset(
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
            padding: EdgeInsets.fromLTRB(13, 0, 13, 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: SvgPicture.asset(
                            ImageConstant.imgBinanceCoin,
                            width: 16.0,
                            height: 16.0,
                          ),
                        ),
                        TextSpan(
                          text: "\$" + price,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    onTap(id);
                  },
                  child: Text(
                    "Buy",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
