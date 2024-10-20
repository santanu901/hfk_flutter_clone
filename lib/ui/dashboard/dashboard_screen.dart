import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hfk_flutter_clone/resources/app_dimens.dart';
import 'package:hfk_flutter_clone/resources/app_icons.dart';
import 'package:hfk_flutter_clone/resources/app_strings.dart';
import 'package:hfk_flutter_clone/styles/app_colors.dart';
import 'package:hfk_flutter_clone/styles/theme_text.dart';
import 'package:hfk_flutter_clone/ui/home/home_screen.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: bottomNavBarItemList[selectedBottomNavIndex],
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
          icon:Icon(Icons.home_outlined),
          label: AppStrings.labelBottomNavHome,
        ),
        BottomNavigationBarItem(
          icon:Icon(Icons.agriculture_outlined),
          label: AppStrings.labelBottomNavSellCrop,
        ),
        BottomNavigationBarItem(
          icon:Icon(Icons.list_outlined),
          label: AppStrings.labelBottomNavMyProductList,
        ),
        BottomNavigationBarItem(
          icon:Icon(Icons.auto_graph),
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

  ///Redirection Handler

}
