import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_dastak/configuration_files/constants.dart';
import 'package:e_dastak/screens/about_screen.dart';
import 'package:e_dastak/screens/loading_screens.dart';
import 'package:e_dastak/screens/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_version/new_version.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const AfterSplash(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/splash.jpg"),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}

class AfterSplash extends StatefulWidget {
  const AfterSplash({Key? key}) : super(key: key);

  @override
  State<AfterSplash> createState() => _AfterSplashState();
}

class _AfterSplashState extends State<AfterSplash> {
  @override
  void initState() {
    _checkVersion();
    super.initState();
  }

  void _checkVersion() async {
    final newVersion = NewVersion(
      androidId: "com.vssmp.edastak",
    );
    final status = await newVersion.getVersionStatus();
    var localVersionStatus = status!.localVersion;
    if (localVersionStatus == status.storeVersion) {
    } else {
      try {
        newVersion.showUpdateDialog(
          context: context,
          versionStatus: status,
          allowDismissal: false,
          dialogTitle: "e-Dastak Update Available",
          updateButtonText: "Update",
          dismissButtonText: "Exit",
          dialogText:
              "A new version of e-Dastak is on playstore,\nPlease Update the app from ${status.localVersion} to ${status.storeVersion}.",
          dismissAction: () {
            SystemNavigator.pop();
          },
        );
      } catch (e) {
        () {};
      }
    }
  }

  List carousalList = [
    // "पात्रता की होगी जांच |\nयोजनाओं पर बनेगी समझ |\nजानेंगे आवेदन प्रक्रिया |\nहोगा ऑनलाइन आवेदन |\nअब होगी ऑनलाइन शिकायत |",
    "पात्रता की होगी जांच",
    "योजनाओं पर बनेगी समझ",
    "जानेंगे आवेदन प्रक्रिया",
    "होगा ऑनलाइन आवेदन",
    "अब होगी ऑनलाइन शिकायत",
  ];

  final CarouselController _controller = CarouselController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  appLogo,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  appName,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: splashHeadingTxtStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          " ऐप एक नजर में :-",
                          style: splashCardHeadingTxtStyle,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                        height: 70,
                        initialPage: _current,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 2),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                      ),
                      items: carousalList.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: const BoxDecoration(
                                  color: blueColorTwo,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      15,
                                    ),
                                  ),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(7),
                                  child: Center(
                                    child: Text(
                                      i,
                                      maxLines: 7,
                                      style: splashCardNormalTextStyle,
                                    ),
                                  ),
                                ));
                          },
                        );
                      }).toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: carousalList.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => _controller.animateToPage(entry.key),
                          child: Container(
                            width: 12.0,
                            height: 12.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : blueColorTwo)
                                    .withOpacity(
                                        _current == entry.key ? 1.0 : 0.3)),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                const Divider(
                  indent: 40,
                  endIndent: 40,
                  height: 15,
                  thickness: 1,
                  color: dividerColor,
                ),
                Text(
                  "►  पात्रता की होगी जांच |\n►  योजनाओं पर बनेगी समझ |\n►  जानेंगे आवेदन प्रक्रिया |\n►  होगा ऑनलाइन आवेदन |\n►  अब होगी ऑनलाइन शिकायत |",
                  style: splashNormalTextStyle,
                  textAlign: TextAlign.start,
                ),
                const Divider(
                  indent: 40,
                  endIndent: 40,
                  height: 15,
                  thickness: 1,
                  color: dividerColor,
                ),
                const SizedBox(
                  height: 5,
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 20,
                  runSpacing: 20,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                      child: Text(
                        "होम",
                        style: buttonTxtStyle,
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        side: BorderSide(color: buttonBorderColor),
                      ),
                      padding: const EdgeInsets.all(10),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EnterUserInfoScreen(),
                          ),
                        );
                      },
                    ),
                    MaterialButton(
                      child: Text(
                        "सर्वे",
                        style: buttonTxtStyle,
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        side: BorderSide(color: buttonBorderColor),
                      ),
                      padding: const EdgeInsets.all(10),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SurveyLoadingEffect(),
                          ),
                        );
                      },
                    ),
                    MaterialButton(
                      child: Text(
                        "ऐप की जानकारी",
                        style: buttonTxtStyle,
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        side: BorderSide(color: buttonBorderColor),
                      ),
                      padding: const EdgeInsets.all(10),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AboutScreenLoading(),
                          ),
                        );
                      },
                    ),
                    MaterialButton(
                      child: Text(
                        "बाहर जाएं",
                        style: buttonTxtStyle,
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        side: BorderSide(color: buttonBorderColor),
                      ),
                      padding: const EdgeInsets.all(10),
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//Positioned(
//                     top: 20,
//                     right: 20,
//                     child: SwipeableTile.card(
//                       color: Colors.blue.shade800,
//                       shadow: BoxShadow(
//                         color: Colors.blue.withOpacity(0.35),
//                         blurRadius: 4,
//                         offset: const Offset(2, 2),
//                       ),
//                       horizontalPadding: 0,
//                       verticalPadding: 0,
//                       direction: SwipeDirection.horizontal,
//                       onSwiped: (direction) {},
//                       backgroundBuilder: (context, direction, progress) {
//                         if (direction == SwipeDirection.endToStart) {
//                         } else if (direction == SwipeDirection.startToEnd) {}
//                         return Container();
//                       },
//                       key: UniqueKey(),
//                       child: Container(
//                         padding: const EdgeInsets.all(25),
//                         width: MediaQuery.of(context).size.width * 0.8,
//                         height: MediaQuery.of(context).size.height * 0.55,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "ऐप एक नजर में :-",
//                                   style: splashCardHeadingTxtStyle,
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 Expanded(
//                                   child: Text(
//                                     "अब होगी ऑनलाइन शिकायत |",
//                                     maxLines: 3,
//                                     style: splashCardNormalTextStyle,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 30,
//                     right: 30,
//                     child: SwipeableTile.card(
//                       color: Colors.blue.shade700,
//                       shadow: BoxShadow(
//                         color: Colors.blue.withOpacity(0.35),
//                         blurRadius: 4,
//                         offset: const Offset(2, 2),
//                       ),
//                       horizontalPadding: 0,
//                       verticalPadding: 0,
//                       direction: SwipeDirection.horizontal,
//                       onSwiped: (direction) {},
//                       backgroundBuilder: (context, direction, progress) {
//                         if (direction == SwipeDirection.endToStart) {
//                         } else if (direction == SwipeDirection.startToEnd) {}
//                         return Container();
//                       },
//                       key: UniqueKey(),
//                       child: Container(
//                         padding: const EdgeInsets.all(25),
//                         width: MediaQuery.of(context).size.width * 0.8,
//                         height: MediaQuery.of(context).size.height * 0.55,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "ऐप एक नजर में :-",
//                                   style: splashCardHeadingTxtStyle,
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 Expanded(
//                                   child: Text(
//                                     "होगा ऑनलाइन आवेदन |",
//                                     maxLines: 3,
//                                     style: splashCardNormalTextStyle,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 40,
//                     right: 40,
//                     child: SwipeableTile.card(
//                       color: Colors.blue.shade600,
//                       shadow: BoxShadow(
//                         color: Colors.blue.withOpacity(0.35),
//                         blurRadius: 4,
//                         offset: const Offset(2, 2),
//                       ),
//                       horizontalPadding: 0,
//                       verticalPadding: 0,
//                       direction: SwipeDirection.horizontal,
//                       onSwiped: (direction) {},
//                       backgroundBuilder: (context, direction, progress) {
//                         if (direction == SwipeDirection.endToStart) {
//                         } else if (direction == SwipeDirection.startToEnd) {}
//                         return Container();
//                       },
//                       key: UniqueKey(),
//                       child: Container(
//                         padding: const EdgeInsets.all(25),
//                         width: MediaQuery.of(context).size.width * 0.8,
//                         height: MediaQuery.of(context).size.height * 0.55,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "ऐप एक नजर में :-",
//                                   style: splashCardHeadingTxtStyle,
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 Expanded(
//                                   child: Text(
//                                     "जानेंगे आवेदन प्रक्रिया |",
//                                     maxLines: 3,
//                                     style: splashCardNormalTextStyle,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 50,
//                     right: 50,
//                     child: SwipeableTile.card(
//                       color: Colors.blue.shade500,
//                       shadow: BoxShadow(
//                         color: Colors.blue.withOpacity(0.35),
//                         blurRadius: 4,
//                         offset: const Offset(2, 2),
//                       ),
//                       horizontalPadding: 0,
//                       verticalPadding: 0,
//                       direction: SwipeDirection.horizontal,
//                       onSwiped: (direction) {},
//                       backgroundBuilder: (context, direction, progress) {
//                         if (direction == SwipeDirection.endToStart) {
//                         } else if (direction == SwipeDirection.startToEnd) {}
//                         return Container();
//                       },
//                       key: UniqueKey(),
//                       child: Container(
//                         padding: const EdgeInsets.all(25),
//                         width: MediaQuery.of(context).size.width * 0.8,
//                         height: MediaQuery.of(context).size.height * 0.55,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "ऐप एक नजर में :-",
//                                   style: splashCardHeadingTxtStyle,
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 Expanded(
//                                   child: Text(
//                                     "योजनाओं पर बनेगी समझ |",
//                                     maxLines: 3,
//                                     style: splashCardNormalTextStyle,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 60,
//                     right: 60,
//                     child: SwipeableTile.card(
//                       color: Colors.blue.shade400,
//                       shadow: BoxShadow(
//                         color: Colors.blue.withOpacity(0.35),
//                         blurRadius: 4,
//                         offset: const Offset(2, 2),
//                       ),
//                       horizontalPadding: 0,
//                       verticalPadding: 0,
//                       direction: SwipeDirection.horizontal,
//                       onSwiped: (direction) {},
//                       backgroundBuilder: (context, direction, progress) {
//                         if (direction == SwipeDirection.endToStart) {
//                         } else if (direction == SwipeDirection.startToEnd) {}
//                         return Container();
//                       },
//                       key: UniqueKey(),
//                       child: Container(
//                         padding: const EdgeInsets.all(25),
//                         width: MediaQuery.of(context).size.width * 0.8,
//                         height: MediaQuery.of(context).size.height * 0.55,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "ऐप एक नजर में :-",
//                                   style: splashCardHeadingTxtStyle,
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 Expanded(
//                                   child: Text(
//                                     "पात्रता की होगी जांच |",
//                                     style: splashCardNormalTextStyle,
//                                     maxLines: 3,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),

//  @override
//   void initState() {
//     _checkVersion();
//     super.initState();
//   }
//
//   void _checkVersion() async {
//     final newVersion = NewVersion(
//       androidId: "com.vssmp.edastak",
//     );
//     try {
//       final status = await newVersion.getVersionStatus();
//       newVersion.showUpdateDialog(
//         context: context,
//         versionStatus: status!,
//         allowDismissal: false,
//         dialogTitle: "e-Dastak Update Available",
//         updateButtonText: "Update",
//         dismissButtonText: "Exit",
//         dialogText:
//             "A new version of e-Dastak is on playstore,\nPlease Update the app from ${status.localVersion} to ${status.storeVersion}.",
//         dismissAction: () {
//           SystemNavigator.pop();
//         },
//       );
//     } catch (e) {
//       () {};
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         // color: Color(0xfff7eee9),
//         color: Colors.blue.shade50,
//       ),
//       child: SafeArea(
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Image.asset(
//                   appLogo,
//                   height: 100,
//                   width: 100,
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Text(
//                       appName,
//                       maxLines: 2,
//                       textAlign: TextAlign.center,
//                       style: splashHeadingTxtStyle,
//                     ),
//                     Text(
//                       "By Vikas Samvad",
//                       style: splashNormalTextStyle,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.65,
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Positioned(
//                     top: 10,
//                     right: 10,
//                     child: Card(
//                       elevation: 8,
//                       color: Colors.blue.shade900,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20)),
//                       child: Container(
//                         padding: const EdgeInsets.all(25),
//                         width: MediaQuery.of(context).size.width * 0.8,
//                         height: MediaQuery.of(context).size.height * 0.55,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "ऐप एक नजर में :-",
//                                   style: splashCardHeadingTxtStyle,
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 Expanded(
//                                   child: Text(
//                                     "पात्रता की होगी जांच |\nयोजनाओं पर बनेगी समझ |\nजानेंगे आवेदन प्रक्रिया |\nहोगा ऑनलाइन आवेदन |\nअब होगी ऑनलाइन शिकायत |",
//                                     style: splashCardNormalTextStyle,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 20,
//                     right: 20,
//                     child: SwipeableTile.card(
//                       color: Colors.blue.shade800,
//                       shadow: BoxShadow(
//                         color: Colors.blue.withOpacity(0.35),
//                         blurRadius: 4,
//                         offset: const Offset(2, 2),
//                       ),
//                       horizontalPadding: 0,
//                       verticalPadding: 0,
//                       direction: SwipeDirection.horizontal,
//                       onSwiped: (direction) {},
//                       backgroundBuilder: (context, direction, progress) {
//                         if (direction == SwipeDirection.endToStart) {
//                         } else if (direction == SwipeDirection.startToEnd) {}
//                         return Container();
//                       },
//                       key: UniqueKey(),
//                       child: Container(
//                         padding: const EdgeInsets.all(25),
//                         width: MediaQuery.of(context).size.width * 0.8,
//                         height: MediaQuery.of(context).size.height * 0.55,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "ऐप एक नजर में :-",
//                                   style: splashCardHeadingTxtStyle,
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 Expanded(
//                                   child: Text(
//                                     "अब होगी ऑनलाइन शिकायत |",
//                                     maxLines: 3,
//                                     style: splashCardNormalTextStyle,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 30,
//                     right: 30,
//                     child: SwipeableTile.card(
//                       color: Colors.blue.shade700,
//                       shadow: BoxShadow(
//                         color: Colors.blue.withOpacity(0.35),
//                         blurRadius: 4,
//                         offset: const Offset(2, 2),
//                       ),
//                       horizontalPadding: 0,
//                       verticalPadding: 0,
//                       direction: SwipeDirection.horizontal,
//                       onSwiped: (direction) {},
//                       backgroundBuilder: (context, direction, progress) {
//                         if (direction == SwipeDirection.endToStart) {
//                         } else if (direction == SwipeDirection.startToEnd) {}
//                         return Container();
//                       },
//                       key: UniqueKey(),
//                       child: Container(
//                         padding: const EdgeInsets.all(25),
//                         width: MediaQuery.of(context).size.width * 0.8,
//                         height: MediaQuery.of(context).size.height * 0.55,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "ऐप एक नजर में :-",
//                                   style: splashCardHeadingTxtStyle,
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 Expanded(
//                                   child: Text(
//                                     "होगा ऑनलाइन आवेदन |",
//                                     maxLines: 3,
//                                     style: splashCardNormalTextStyle,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 40,
//                     right: 40,
//                     child: SwipeableTile.card(
//                       color: Colors.blue.shade600,
//                       shadow: BoxShadow(
//                         color: Colors.blue.withOpacity(0.35),
//                         blurRadius: 4,
//                         offset: const Offset(2, 2),
//                       ),
//                       horizontalPadding: 0,
//                       verticalPadding: 0,
//                       direction: SwipeDirection.horizontal,
//                       onSwiped: (direction) {},
//                       backgroundBuilder: (context, direction, progress) {
//                         if (direction == SwipeDirection.endToStart) {
//                         } else if (direction == SwipeDirection.startToEnd) {}
//                         return Container();
//                       },
//                       key: UniqueKey(),
//                       child: Container(
//                         padding: const EdgeInsets.all(25),
//                         width: MediaQuery.of(context).size.width * 0.8,
//                         height: MediaQuery.of(context).size.height * 0.55,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "ऐप एक नजर में :-",
//                                   style: splashCardHeadingTxtStyle,
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 Expanded(
//                                   child: Text(
//                                     "जानेंगे आवेदन प्रक्रिया |",
//                                     maxLines: 3,
//                                     style: splashCardNormalTextStyle,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 50,
//                     right: 50,
//                     child: SwipeableTile.card(
//                       color: Colors.blue.shade500,
//                       shadow: BoxShadow(
//                         color: Colors.blue.withOpacity(0.35),
//                         blurRadius: 4,
//                         offset: const Offset(2, 2),
//                       ),
//                       horizontalPadding: 0,
//                       verticalPadding: 0,
//                       direction: SwipeDirection.horizontal,
//                       onSwiped: (direction) {},
//                       backgroundBuilder: (context, direction, progress) {
//                         if (direction == SwipeDirection.endToStart) {
//                         } else if (direction == SwipeDirection.startToEnd) {}
//                         return Container();
//                       },
//                       key: UniqueKey(),
//                       child: Container(
//                         padding: const EdgeInsets.all(25),
//                         width: MediaQuery.of(context).size.width * 0.8,
//                         height: MediaQuery.of(context).size.height * 0.55,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "ऐप एक नजर में :-",
//                                   style: splashCardHeadingTxtStyle,
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 Expanded(
//                                   child: Text(
//                                     "योजनाओं पर बनेगी समझ |",
//                                     maxLines: 3,
//                                     style: splashCardNormalTextStyle,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 60,
//                     right: 60,
//                     child: SwipeableTile.card(
//                       color: Colors.blue.shade400,
//                       shadow: BoxShadow(
//                         color: Colors.blue.withOpacity(0.35),
//                         blurRadius: 4,
//                         offset: const Offset(2, 2),
//                       ),
//                       horizontalPadding: 0,
//                       verticalPadding: 0,
//                       direction: SwipeDirection.horizontal,
//                       onSwiped: (direction) {},
//                       backgroundBuilder: (context, direction, progress) {
//                         if (direction == SwipeDirection.endToStart) {
//                         } else if (direction == SwipeDirection.startToEnd) {}
//                         return Container();
//                       },
//                       key: UniqueKey(),
//                       child: Container(
//                         padding: const EdgeInsets.all(25),
//                         width: MediaQuery.of(context).size.width * 0.8,
//                         height: MediaQuery.of(context).size.height * 0.55,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "ऐप एक नजर में :-",
//                                   style: splashCardHeadingTxtStyle,
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 Expanded(
//                                   child: Text(
//                                     "पात्रता की होगी जांच |",
//                                     style: splashCardNormalTextStyle,
//                                     maxLines: 3,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Wrap(
//               alignment: WrapAlignment.center,
//               spacing: 20,
//               runSpacing: 20,
//               // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 MaterialButton(
//                   child: Text(
//                     "होम",
//                     style: buttonTxtStyle,
//                   ),
//                   shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(10.0),
//                     ),
//                     side: BorderSide(color: buttonBorderColor),
//                   ),
//                   padding: const EdgeInsets.all(10),
//                   onPressed: () {
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const EnterUserInfoScreen(),
//                       ),
//                     );
//                   },
//                 ),
//                 MaterialButton(
//                   child: Text(
//                     "सर्वे",
//                     style: buttonTxtStyle,
//                   ),
//                   shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(10.0),
//                     ),
//                     side: BorderSide(color: buttonBorderColor),
//                   ),
//                   padding: const EdgeInsets.all(10),
//                   onPressed: () {
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const SurveyLoadingEffect(),
//                       ),
//                     );
//                   },
//                 ),
//                 MaterialButton(
//                   child: Text(
//                     "ऐप की जानकारी",
//                     style: buttonTxtStyle,
//                   ),
//                   shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(10.0),
//                     ),
//                     side: BorderSide(color: buttonBorderColor),
//                   ),
//                   padding: const EdgeInsets.all(10),
//                   onPressed: () {
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const AboutScreenLoading(),
//                       ),
//                     );
//                   },
//                 ),
//                 MaterialButton(
//                   child: Text(
//                     "बाहर जाएं",
//                     style: buttonTxtStyle,
//                   ),
//                   shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(10.0),
//                     ),
//                     side: BorderSide(color: buttonBorderColor),
//                   ),
//                   padding: const EdgeInsets.all(10),
//                   onPressed: () {
//                     SystemNavigator.pop();
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// child: Stack(
//   alignment: Alignment.center,
//   children: [
//     Positioned(
//       top: 10,
//       right: 10,
//       child: Card(
//         elevation: 8,
//         color: Colors.blue.shade900,
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20)),
//         child: Container(
//           padding: const EdgeInsets.all(25),
//           width: MediaQuery.of(context).size.width * 0.8,
//           height: MediaQuery.of(context).size.height * 0.55,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text(
//                     "ऐप एक नजर में :-",
//                     style: splashCardHeadingTxtStyle,
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Expanded(
//                     child: Text(
//                       "पात्रता की होगी जांच |\nयोजनाओं पर बनेगी समझ |\nजानेंगे आवेदन प्रक्रिया |\nहोगा ऑनलाइन आवेदन |\nअब होगी ऑनलाइन शिकायत |",
//                       style: splashCardNormalTextStyle,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   ],
// ),
//Positioned(
//                     top: 60,
//                     right: 60,
//                     child: SwipeableTile.card(
//                       color: Colors.blue.shade400,
//                       shadow: BoxShadow(
//                         color: Colors.blue.withOpacity(0.35),
//                         blurRadius: 4,
//                         offset: Offset(2, 2),
//                       ),
//                       horizontalPadding: 0,
//                       verticalPadding: 0,
//                       direction: SwipeDirection.horizontal,
//                       onSwiped: (direction) {},
//                       backgroundBuilder: (context, direction, progress) {
//                         if (direction == SwipeDirection.endToStart) {
//                         } else if (direction == SwipeDirection.startToEnd) {}
//                         return Container();
//                       },
//                       key: UniqueKey(),
//                       child: Container(
//                         padding: const EdgeInsets.all(25),
//                         width: MediaQuery.of(context).size.width * 0.8,
//                         height: MediaQuery.of(context).size.height * 0.55,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "ऐप एक नजर में :-",
//                                   style: splashCardHeadingTxtStyle,
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 Expanded(
//                                   child: Text(
//                                     "पात्रता की होगी जांच |",
//                                     style: splashCardNormalTextStyle,
//                                     maxLines: 3,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),

//return Container(
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         image: DecorationImage(
//           image: AssetImage("assets/splash.jpg"),
//           fit: BoxFit.fitHeight,
//         ),
//       ),
//     );

//padding: const EdgeInsets.all(40),
//       color: backgroundColor,
// child: Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     CircleAvatar(
//       minRadius: 50,
//       maxRadius: 200,
//       backgroundColor: logoBackgroundColor,
//       child: Image.asset(
//         appLogo,
//       ),
//     ),
//     Text(
//       appName,
//       maxLines: 2,
//       textAlign: TextAlign.center,
//       style: splashScreenHeadingTxtStyle,
//     ),
//     Text(
//       "By Vikas Samvad",
//       style: splashScreenTxtStyle,
//     ),
//     LoadingAnimationWidget.staggeredDotsWave(
//       color: splashScreenLoaderColor,
//       size: 60,
//     ),
//   ],
// ),
