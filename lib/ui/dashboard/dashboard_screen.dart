import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hfk_flutter_clone/core/app_constants.dart';
import 'package:hfk_flutter_clone/core/app_routes.dart';
import 'package:hfk_flutter_clone/core/app_urls.dart';
import 'package:hfk_flutter_clone/resources/app_dimens.dart';
import 'package:hfk_flutter_clone/resources/app_icons.dart';
import 'package:hfk_flutter_clone/resources/app_strings.dart';
import 'package:hfk_flutter_clone/styles/app_colors.dart';
import 'package:hfk_flutter_clone/styles/theme_text.dart';
import 'package:hfk_flutter_clone/ui/home/home_screen.dart';
import 'package:hfk_flutter_clone/ui/web_view/web_view_screen.dart';
import 'package:share_plus/share_plus.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var selectedBottomNavIndex = 0;

  final bottomNavBarItemList = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  void shareHFKAPP() {
    Share.share(AppStrings.shareHFKAppUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: _buildNavDrawer(),
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: bottomNavBarItemList[selectedBottomNavIndex],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        "Home",
        style: ThemeText.font15Medium.apply(
          color: AppColors.white,
        ),
      ),
      backgroundColor: AppColors.americanGreen,
      iconTheme: const IconThemeData(
        color: AppColors.white,
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: AppColors.white,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle:
          ThemeText.font13Regular.apply(color: AppColors.americanGreen),
      unselectedLabelStyle:
          ThemeText.font13Regular.apply(color: AppColors.darkSilver),
      selectedItemColor: AppColors.americanGreen,
      iconSize: AppDimens.size_32,
      unselectedItemColor: AppColors.darkSilver,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: AppStrings.labelBottomNavHome,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.agriculture_outlined),
          label: AppStrings.labelBottomNavSellCrop,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list_outlined),
          label: AppStrings.labelBottomNavMyProductList,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.auto_graph),
          label: AppStrings.labelBottomNavMarketValue,
        ),
      ],
      currentIndex: selectedBottomNavIndex,
      onTap: (index) {
        setState(() {
          selectedBottomNavIndex = index;
        });
      },
    );
  }

  Drawer _buildNavDrawer() {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(AppDimens.size_0),
        children: [
          _buildNavDrawerHeader(),
          _buildNavDrawerItemMyProfile(),
          _buildNavDrawerItemMyOrder(),
          _buildNavDrawerItemMyTask(),
          _buildNavDrawerItemMyNotification(),
          _buildNavDrawerItemMyProduct(),
          _buildNavDrawerItemMyWishList(),
          _buildNavDrawerItemMarketValue(),
          _buildNavDrawerItemCompanyDetails(),
          _buildNavDrawerItemDivider(),
          _buildNavDrawerItemTermsCondition(),
          _buildNavDrawerItemPrivacyPolicy(),
          _buildNavDrawerItemShareHFK(),
          _buildNavDrawerItemLogout(),
        ],
      ),
    );
  }

  DrawerHeader _buildNavDrawerHeader() {
    return DrawerHeader(
        decoration: const BoxDecoration(color: AppColors.kellyGreen),
        child: UserAccountsDrawerHeader(
          decoration: const BoxDecoration(color: AppColors.kellyGreen),
          accountName: Text(
            "Santanu Mukherjee",
            style: ThemeText.font17SemiBold.apply(
              color: AppColors.white,
            ),
          ),
          accountEmail: Text("santanu@gmail.com",
              style: ThemeText.font15Regular.apply(
                color: AppColors.white,
              )),
          currentAccountPictureSize: const Size.square(AppDimens.size_48),
          currentAccountPicture: CircleAvatar(
            backgroundColor: AppColors.lightSlateGrey,
            child: Text(
              "SM",
              style: ThemeText.font17Medium.apply(
                color: AppColors.white,
              ),
            ),
          ),
        ));
  }

  Widget _buildNavDrawerItemDivider() {
    return const Divider(
      height: AppDimens.size_2,
      color: AppColors.lightSlateGrey,
    );
  }

  Widget _buildNavDrawerItemMyProfile() {
    return ListTile(
      leading: const Icon(Icons.person),
      title: const Text(AppStrings.labelNavDrawerMyProfile),
      onTap: () {
        navigateToBack();
      },
    );
  }

  Widget _buildNavDrawerItemMyOrder() {
    return ListTile(
      leading: const Icon(Icons.shopping_basket),
      title: const Text(AppStrings.labelNavDrawerMyOrder),
      onTap: () {
        navigateToBack();
      },
    );
  }

  Widget _buildNavDrawerItemMyTask() {
    return ListTile(
      leading: const Icon(Icons.task),
      title: const Text(AppStrings.labelNavDrawerMyTask),
      onTap: () {
        navigateToBack();
      },
    );
  }

  Widget _buildNavDrawerItemMyNotification() {
    return ListTile(
      leading: const Icon(Icons.notifications_none),
      title: const Text(AppStrings.labelNavDrawerMyNotification),
      onTap: () {
        navigateToBack();
      },
    );
  }

  Widget _buildNavDrawerItemMyProduct() {
    return ListTile(
      leading: const Icon(Icons.list),
      title: const Text(AppStrings.labelNavDrawerMyProduct),
      onTap: () {
        navigateToBack();
      },
    );
  }

  Widget _buildNavDrawerItemMyWishList() {
    return ListTile(
      leading: const Icon(Icons.heart_broken_rounded),
      title: const Text(AppStrings.labelNavDrawerMyWishList),
      onTap: () {
        navigateToBack();
      },
    );
  }

  Widget _buildNavDrawerItemMarketValue() {
    return ListTile(
      leading: const Icon(Icons.auto_graph),
      title: const Text(AppStrings.labelNavDrawerMarketValue),
      onTap: () {
        navigateToBack();
      },
    );
  }

  Widget _buildNavDrawerItemCompanyDetails() {
    return ListTile(
      leading: const Icon(Icons.factory_outlined),
      title: const Text(AppStrings.labelNavDrawerCompanyDetails),
      onTap: () {
        navigateToBack();
      },
    );
  }

  Widget _buildNavDrawerItemTermsCondition() {
    return ListTile(
      leading: const Icon(Icons.chat_bubble_outline),
      title: const Text(AppStrings.labelNavDrawerTermsCondition),
      onTap: () {
        navigateToBack();
        navigateToWebView(AppStrings.appbarTitleTermsCondition, AppUrls.urlTermsConditions);
      },
    );
  }

  Widget _buildNavDrawerItemPrivacyPolicy() {
    return ListTile(
      leading: const Icon(Icons.privacy_tip_outlined),
      title: const Text(AppStrings.labelNavDrawerPrivacyPolicy),
      onTap: () {
        navigateToBack();
        navigateToWebView(AppStrings.appbarTitlePrivacyPolicy, AppUrls.urlPrivacyPolicy);
      },
    );
  }

  Widget _buildNavDrawerItemShareHFK() {
    return ListTile(
      leading: const Icon(Icons.share),
      title: const Text(AppStrings.labelNavDrawerShareHfk),
      onTap: () {
        navigateToBack();
        shareHFKAPP();
      },
    );
  }

  Widget _buildNavDrawerItemLogout() {
    return ListTile(
      leading: const Icon(Icons.logout_outlined),
      title: const Text(AppStrings.labelNavDrawerAccountLogout),
      onTap: () {
        navigateToBack();
        _showLogoutDialog(context);
      },
    );
  }

  ///Show Dialog
  void _showLogoutDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              AppStrings.labelDialogLogoutTitle,
              style: ThemeText.font19SemiBold,
            ),
            content: const Text(
              AppStrings.labelDialogLogoutContent,
              style: ThemeText.font15Regular,
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  navigateToBack();
                },
                child: const Text(
                  AppStrings.labelDialogCancel,
                  style: ThemeText.font13SemiBold,
                ),
              ),
              TextButton(
                onPressed: () {
                  navigateToBack();
                  navigateToLogin();
                },
                child: const Text(
                  AppStrings.labelDialogConfirm,
                  style: ThemeText.font13SemiBold,
                ),
              ),
            ],
          );
        });
  }

  ///Navigation Handler
  void navigateToBack() {
    Navigator.of(context).pop();
  }

  void navigateToWebView(String appbarTitle, String webUrl) {
    Get.toNamed(AppRoutes.webView, parameters: {
      AppConstants.intentKeyAppBarTitle: appbarTitle,
      AppConstants.intentKeyWebURL: webUrl,
    });
    /*Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => WebViewScreen(
          intentKeyAppBarTitle: appbarTitle,
          intentKeyWebUrl: webUrl,
        ),
      ),
    );*/
  }

  void navigateToLogin() {
    Get.offNamedUntil(AppRoutes.login, (r) => false);
  }

  ///Click Handler
}
