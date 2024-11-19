import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hfk_flutter_clone/core/app_constants.dart';
import 'package:hfk_flutter_clone/resources/app_dimens.dart';
import 'package:hfk_flutter_clone/resources/app_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> carouselImageList = [
    "https://plus.unsplash.com/premium_photo-1661963447711-27f892ffe292?q=80&w=1473&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://plus.unsplash.com/premium_photo-1683141176675-d516a6947498?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/32/RgJQ82pETlKd0B7QzcJO_5912578701_92397ba76c_b.jpg?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8Zmxvd2VyfGVufDB8fDB8fHww",
    "https://images.unsplash.com/photo-1524514587686-e2909d726e9b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fG1hY2hpbmV8ZW58MHx8MHx8fDA%3D",
    "https://www.retcustomsbrokerage.com/wp-content/themes/retcustoms/images/resource/br.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildItemSpacingVertical(AppDimens.size_16),
              _buildCarouselSliderHeader()
            ],
          ),
        ),
      ),
    );
  }

  ///UI Builder
  Widget _buildItemSpacingVertical(double boxHeight) {
    return SizedBox(
      height: boxHeight,
    );
  }

  Widget _buildItemSpacingHorizontal(double boxWidth) {
    return SizedBox(
      width: boxWidth,
    );
  }

  Widget _buildCarouselSliderHeader() {
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.size_8,
        ),
        child: CarouselSlider(
          options: CarouselOptions(
            height: AppDimens.size_200,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval:
                const Duration(milliseconds: AppConstants.milliSeconds3000),
            autoPlayAnimationDuration:
                const Duration(milliseconds: AppConstants.milliSeconds800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
          items: carouselImageList.map(
            (item) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: Get.width,
                    margin: const EdgeInsets.symmetric(
                      horizontal: AppDimens.size_2,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(AppDimens.size_8),
                      child: CachedNetworkImage(
                        imageUrl: item,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) =>
                            Image.asset(AppIcons.icPlaceholder),
                        errorWidget: (context, url, error) =>
                            Image.asset(AppIcons.icPlaceholder),
                      ),
                    ),
                  );
                },
              );
            },
          ).toList(),
        ));
  }
}
