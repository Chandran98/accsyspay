import 'package:Accsys_Pay/MainApp/provider/banner_provider.dart';
import 'package:Accsys_Pay/MainApp/provider/themeprovider.dart';
import 'package:Accsys_Pay/pages/screens.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../utils/main_app_utils.dart';
import '../utils/shimmer_List.dart';
import 'package:dots_indicator/dots_indicator.dart';

class BannerComponent extends StatefulWidget {
  const BannerComponent({Key key}) : super(key: key);

  @override
  _BannerComponentState createState() => _BannerComponentState();
}

class _BannerComponentState extends State<BannerComponent> {
  @override
  void initState() {
    Provider.of<BannerProvider>(context, listen: false).fetchBanner();
    super.initState();
  }

  int _currentSlide = 1;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BannerProvider>(context);
    var theme = Provider.of<ThemeProvider>(context);
    return provider.loading
        ? const ShimmerBanner()
        : Column(
            children: [
              spacer10Height,
              CarouselSlider(
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentSlide = index;
                    });
                  },
                  height: 18.4.h,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items: provider.imageUrls.map((url) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                        ),
                        child: Image.network(
                          url,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              spacer5Height,

              // DotsIndicator(
              //   position: _currentSlide,
              //   decorator: DotsDecorator(
              //     activeColor: appColor,
              //     size: Size.square(7.0),
              //     activeSize: Size.square(10.0),
              //     activeShape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(25.0),
              //     ),
              //   ),
              //   dotsCount: provider.imageUrls.length,
              //   axis: Axis.horizontal,
              // ),
            ],
          );
  }
}
