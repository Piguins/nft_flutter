import 'package:flutter/material.dart';
import '../core/app_export.dart';

enum BottomBarEnum { Home, Favourite, Wallet, Account }
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgNavHome,
      activeIcon: ImageConstant.imgNavHome,
      title: "Home",
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavFavourite,
      activeIcon: ImageConstant.imgNavFavourite,
      title: "Favourite",
      type: BottomBarEnum.Favourite,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgDiamond1,
      activeIcon: ImageConstant.imgDiamond1,
      title: "Home",
      type: BottomBarEnum.Home,
      isCircle: true,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgWalletSvgrepoCom,
      activeIcon: ImageConstant.imgWalletSvgrepoCom,
      title: "Wallet",
      type: BottomBarEnum.Wallet,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgAccountSvgrepoCom,
      activeIcon: ImageConstant.imgAccountSvgrepoCom,
      title: "Account",
      type: BottomBarEnum.Account,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.v,
      decoration: BoxDecoration(
        color: theme.colorScheme.secondaryContainer,
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          if (bottomMenuList[index].isCircle) {
            return BottomNavigationBarItem(
              icon: CustomImageView(
                imagePath: bottomMenuList[index].icon,
                height: 35.v,
                width: 45.h,
              ),
              label: '',
            );
          }
          return BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: bottomMenuList[index].icon,
                  height: 23.v,
                  width: 25.h,
                  color: theme.colorScheme.onError,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.v),
                  child: Text(
                    bottomMenuList[index].title ?? "",
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: theme.colorScheme.onError,
                    ),
                  ),
                )
              ],
            ),
            activeIcon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: bottomMenuList[index].activeIcon,
                  height: 23.v,
                  width: 27.h,
                  color: theme.colorScheme.primary,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.v),
                  child: Text(
                    bottomMenuList[index].title ?? "",
                    style: CustomTextStyles.bodyMediumPrimary.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                )
              ],
            ),
            label: '',
          );
        }),
        onTap: (index) {
          selectedIndex = index;
          widget.onChanged?.call(bottomMenuList[index].type);
          setState(() {});
        },
      ),
    );
  }
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class BottomMenuModel {
  BottomMenuModel(
      {required this.icon,
      required this.activeIcon,
      this.title,
      required this.type,
      this.isCircle = false});

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;

  bool isCircle;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffffffff),
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
