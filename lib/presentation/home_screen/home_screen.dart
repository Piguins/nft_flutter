import 'package:application/core/utils/image_constant.dart';
import 'package:application/core/utils/size_utils.dart';
import 'package:application/presentation/home_screen/ItemCard.dart';
import 'package:application/presentation/home_screen/ItemDetailPopup.dart';
import 'package:application/theme/theme_helper.dart';
import 'package:application/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25.0, top: 25.0),
                  child: Text(
                    "Explore",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                SizedBox(height: 25.0),
                Padding(
                  padding: EdgeInsets.only(
                    left: 25.h,
                    right: 25.h,
                  ),
                  child: CustomSearchView(
                    // controller: searchController,
                    hintText: "Search items",
                  ),
                ),
                SizedBox(height: 26.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15.0,
                      mainAxisSpacing: 15.0,
                      childAspectRatio: 0.85,
                    ),
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Itemcard(
                          id: index.toString(),
                          imagePath: ImageConstant.imgShoe,
                          price: ((index + 1) * 1000).toString(),
                          onTap: (id) {
                            // Show popup with item details
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return ItemDetailPopup(
                                    id: id,
                                    imagePath: ImageConstant.imgShoe,
                                    price: ((index + 1) * 1000).toString(),
                                    onTap: (id) {
                                      // Do something
                                    },
                                  );
                                });
                          });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
