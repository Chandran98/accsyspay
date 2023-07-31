import 'dart:async';import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Whatsapp extends StatefulWidget {
  

  @override
  State<Whatsapp> createState() => _WhatsappState();
}

class _WhatsappState extends State<Whatsapp> {
  ScrollController _scrollController = ScrollController();
  bool isCollapse = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff118578),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "WhatsApp",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              margin: EdgeInsets.all(10),
              height: isCollapse ? 60 : 170,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Stack(
                      // alignment: Alignment.center,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastOutSlowIn,
                          height: double.infinity,
                          width: isCollapse ? 0 : 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.2),
                            ),
                          ),
                          child: isCollapse
                              ? SizedBox.shrink()
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Icon(
                                      Icons.add_circle_outline_rounded,
                                      size: 30,
                                    ),
                                    Text(
                                      "Create Story",
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            padding: EdgeInsets.all(2),
                            margin: EdgeInsets.all(isCollapse ? 0 : 10),
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xff23c861),
                                  Color(0xff31aee5),
                                ],
                              ),
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.network(
                                      "https://picsum.photos/100/100?random=90",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.white,
                                    ),
                                    child: Icon(
                                      Icons.add_circle_rounded,
                                      color: Colors.blue,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Stack(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastOutSlowIn,
                              height: double.infinity,
                              width: isCollapse ? 0 : 120,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  "https://picsum.photos/100/100?random=${index + 20}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                margin: EdgeInsets.all(isCollapse ? 0 : 10),
                                padding: EdgeInsets.all(2),
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xff23c861),
                                      Color(0xff31aee5),
                                    ],
                                  ),
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.network(
                                      "https://picsum.photos/100/100?random=$index",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                border: Border.all(
                  width: 2.0,
                  color: Colors.grey.withOpacity(0.2),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: NotificationListener(
                        onNotification: (t) {
                          if (t is ScrollEndNotification) {
                            print(_scrollController.position.pixels);
                            if (_scrollController.position.pixels > 30) {
                              Timer(Duration(milliseconds: 100), () {
                                if (mounted)
                                  setState(() {
                                    isCollapse = true;
                                  });
                              });
                            } else {
                              Timer(Duration(milliseconds: 100), () {
                                if (mounted)
                                  setState(() {
                                    isCollapse = false;
                                  });
                              });
                            }
                          }
                          return true;
                        },
                        child: ListView.builder(
                          controller: _scrollController,
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          itemCount: 100,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                ListTile(
                                  leading: Container(
                                    padding: EdgeInsets.all(2),
                                    margin: EdgeInsets.only(right: 10),
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xff23c861),
                                          Color(0xff31aee5),
                                        ],
                                      ),
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.all(1),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.white,
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.network(
                                          "https://picsum.photos/100/100?random=$index",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  title: Text("Name $index"),
                                  subtitle: Text("Chat $index"),
                                ),
                                SizedBox(
                                  height: 15,
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}



class SlideAnimation extends StatefulWidget {

  @override
  State<SlideAnimation> createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation> {
  CarouselController carousel1Controller = CarouselController();
  CarouselController carousel2Controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            CarouselSlider.builder(
              carouselController: carousel1Controller,
              itemCount: 10,
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height,
                aspectRatio: 0.5,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: true,
                autoPlay: false,
                enlargeCenterPage: false,
                scrollDirection: Axis.horizontal,
                scrollPhysics: NeverScrollableScrollPhysics(),
              ),
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                return Container(
                  child: Image.network(
                    "https://picsum.photos/1080/1920?random=${itemIndex + 10}",
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.8),
                      Colors.black.withOpacity(0.5),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CarouselSlider.builder(
                carouselController: carousel2Controller,
                itemCount: 10,
                options: CarouselOptions(
                  height: 400,
                  aspectRatio: 0.2,
                  viewportFraction: 0.55,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      carousel1Controller.animateToPage(index,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.fastOutSlowIn);
                    });
                  },
                  scrollDirection: Axis.horizontal,
                ),
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  return Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        "https://picsum.photos/1080/1920?random=${itemIndex + 10}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class CustomNavbar extends StatefulWidget {


  @override
  State<CustomNavbar> createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  List<Widget> listPage = [
    Container(
      color: Colors.amber,
      child: Center(
        child: Text("Home"),
      ),
    ),
    Container(
      color: Colors.blue,
      child: Center(
        child: Text("Search"),
      ),
    ),
    Container(
      color: Colors.red,
      child: Center(
        child: Text("Chat"),
      ),
    ),
    Container(
      color: Colors.yellow,
      child: Center(
        child: Text("Profile"),
      ),
    ),
  ];
  PageController pageController = PageController();
  final PageStorageBucket bucket = PageStorageBucket();
  bool isNavbarClosed = false;

  onPageChanged(index) {
    setState(() {
      pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isNavbarClosed = true;
                });
              },
              child: PageStorage(
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  children: listPage,
                  controller: pageController,
                  onPageChanged: onPageChanged,
                ),
                bucket: bucket,
              ),
            ),
            AnimatedPositioned(
              right: !isNavbarClosed ? -50 : 0,
              bottom: 150,
              duration: Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isNavbarClosed = false;
                  });
                },
                child: Container(
                  padding: EdgeInsets.only(left: 5, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                  child: Center(
                    child: Icon(Icons.arrow_back_ios),
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              right: isNavbarClosed ? -52 : 0,
              bottom: 0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        onPageChanged(0);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: Icon(
                          Icons.home,
                          size: 32,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        onPageChanged(1);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: Icon(
                          Icons.search,
                          size: 32,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        onPageChanged(2);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: Icon(
                          Icons.chat,
                          size: 32,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        onPageChanged(3);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: Icon(
                          Icons.person,
                          size: 32,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}






class EyeAnimation extends StatefulWidget {
  EyeAnimation({Key key}) : super(key: key);

  @override
  State<EyeAnimation> createState() => _EyeAnimationState();
}

class _EyeAnimationState extends State<EyeAnimation> {
  var isClosedEye = false;
  var timeClose;
  var posX = 70 / 2;
  var posY = 90 / 2;
  Timer _timer;

  @override
  void initState() {
    startAnimation();
    super.initState();
  }

  startAnimation() {
    _timer = Timer.periodic(Duration(milliseconds: 500), (Timer t) {
      print(t.tick);
      if ((t.tick % 10) == 0) {
        setState(() {
          isClosedEye = true;
          timeClose = t.tick + 2;
        });
      } //open eyes

      if (timeClose == t.tick) {
        setState(() {
          isClosedEye = false;
        });
      } //close eye
    });

    _timer = Timer.periodic(Duration(milliseconds: 200), (Timer t) {
      if ((t.tick % 8) == 0) {
        setState(() {
          posX = Random().nextInt(70).toDouble();
          posY = Random().nextInt(90).toDouble();
        });
      } //move eyeball
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: Container(),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              height: MediaQuery.of(context).size.height / 3,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100),
                        ),
                        border: Border.all(
                          width: 3,
                          color: Colors.black,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              top: 90,
                            ),
                            child: Stack(
                              children: [
                                AnimatedPositioned(
                                  duration: const Duration(seconds: 2),
                                  curve: Curves.fastOutSlowIn,
                                  bottom: posX,
                                  right: posY,
                                  child: Container(
                                    width: 70,
                                    height: 110,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.all(
                                        Radius.elliptical(80, 130),
                                      ),
                                    ),
                                  ),
                                ),
                                AnimatedPositioned(
                                  duration: const Duration(seconds: 2),
                                  curve: Curves.fastOutSlowIn,
                                  top: 23,
                                  right: 55,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastOutSlowIn,
                            height: MediaQuery.of(context).size.height /
                                (isClosedEye ? 3 : 8),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xff8D5524),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(100),
                                topRight: Radius.circular(100),
                              ),
                              // border: Border(
                              //   bottom: BorderSide(
                              //     color: Colors.indigo,
                              //     width: 7,
                              //   ),
                              // ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100),
                        ),
                        border: Border.all(
                          width: 3,
                          color: Colors.black,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              top: 90,
                            ),
                            child: Stack(
                              children: [
                                AnimatedPositioned(
                                  duration: const Duration(seconds: 2),
                                  curve: Curves.fastOutSlowIn,
                                  bottom: posX,
                                  right: posY,
                                  child: Container(
                                    width: 70,
                                    height: 110,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.all(
                                        Radius.elliptical(80, 130),
                                      ),
                                    ),
                                  ),
                                ),
                                AnimatedPositioned(
                                  duration: const Duration(seconds: 2),
                                  curve: Curves.fastOutSlowIn,
                                  top: 23,
                                  right: 55,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastOutSlowIn,
                            height: MediaQuery.of(context).size.height /
                                (isClosedEye ? 3 : 8),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xff8D5524),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(100),
                                topRight: Radius.circular(100),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}