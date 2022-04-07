import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//App Requirements
const String appName = 'e-Dastak | ई-दस्तक';
const String appLogo = 'assets/logo.png';
const String uriAuthority = "vssmp.mltech.co.in";
const String staticAppToken = "LM5G8OhT916hpotvgYoEINgmBrDpjZmwo7ehBjexD1g=";
String sessionToken = DateTime.now().toString();
var surveyQueList = [];
var yojnaDataList = [];

//Widget Constants
const String yesButVar = 'हाँ';
const String noButVar = 'नहीं';
const double aboutButtonWidth = 280;

//Color Palette
const Color darkBlueColor = Color(0xff1f438f);
const Color blueColorOne = Color(0xff21407e);
const Color blueColorTwo = Color(0xff2f5bb2);
const Color blueColorThree = Color(0xff2b53a4);
const Color whiteColor = Colors.white;

//Colors on Widgets
const Color logoBackgroundColor = whiteColor;
const Color backgroundColor = whiteColor;
const Color headingTxtColor = blueColorOne;
const Color textColor = blueColorThree;
const Color appBarBgColor = darkBlueColor;
const Color extendedAppBarColor = blueColorOne;
const Color appBarTxtColor = whiteColor;
const Color appBarIconColor = whiteColor;
const Color sideBarBgColor = blueColorTwo;
const Color sideBarTxtColor = whiteColor;
const Color sideBarIconColor = whiteColor;
const Color sideBarHeaderBgColor = darkBlueColor;
const Color sideBarHeaderTxtColor = whiteColor;
const Color buttonTxtColor = blueColorOne;
const Color buttonBgColor = whiteColor;
const Color buttonBorderColor = blueColorOne;
const Color toggleButtonActiveTxtColor = whiteColor;
const Color toggleButtonInActiveTxtColor = blueColorOne;
const Color cardBgColor = blueColorOne;
const Color cardTxtColor = whiteColor;
const Color cardBorderColor = blueColorOne;
const Color iconColor = blueColorOne;
const Color iconOnDarkColor = whiteColor;
const Color loaderColor = blueColorThree;
const Color dividerColor = blueColorOne;
const Color yojDescHeadingTxtColor = Color(0xffc40e37);
const Color yojDescTxtColor = blueColorThree;
const Color aboutTxtColor = blueColorOne;
const Color shimmerColor = blueColorOne;
const Color ipBoxTxtColor = blueColorOne;
const Color ipBoxBorderColor = blueColorOne;
const Color userInfoHeadingTxtColor = blueColorOne;
const Color backgroundOpaqueColor = whiteColor;

BoxDecoration backgroundsColor = const BoxDecoration(
    gradient: LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: [
    Colors.white60,
    Colors.white60,
  ],
));

Color getLoaderColor() {
  return blueColorOne;
}

//Google Font Styles
TextStyle engFonts(textStyle) {
  return GoogleFonts.comfortaa(
    textStyle: textStyle,
  );
}

TextStyle hindiFonts(textStyle) {
  return GoogleFonts.poppins(
    textStyle: textStyle,
  );
}

//English TextStyles
TextStyle headingTxtStyle = engFonts(
  const TextStyle(
    color: headingTxtColor,
    fontWeight: FontWeight.bold,
    fontSize: 20,
    decoration: TextDecoration.none,
  ),
);
TextStyle normalTextStyle = engFonts(
  const TextStyle(
    color: textColor,
    fontSize: 18,
    decoration: TextDecoration.none,
  ),
);

TextStyle splashHeadingTxtStyle = hindiFonts(
  const TextStyle(
    color: headingTxtColor,
    // fontWeight: FontWeight.bold,
    fontSize: 22,
    decoration: TextDecoration.none,
  ),
);
TextStyle splashNormalTextStyle = hindiFonts(
  const TextStyle(
    color: textColor,
    fontSize: 18,
    decoration: TextDecoration.none,
  ),
);
TextStyle splashCardHeadingTxtStyle = hindiFonts(
  const TextStyle(
    color: blueColorTwo,
    // fontWeight: FontWeight.bold,
    fontSize: 20,
    decoration: TextDecoration.none,
  ),
);
TextStyle splashCardNormalTextStyle = hindiFonts(
  const TextStyle(
    color: Colors.white,
    fontSize: 20,
    decoration: TextDecoration.none,
  ),
);

TextStyle appBarTxtStyle = hindiFonts(
  const TextStyle(
    color: appBarTxtColor,
    // fontWeight: FontWeight.bold,
    fontSize: 20,
  ),
);
TextStyle sideBarHeadingTxtStyle = engFonts(
  const TextStyle(
    color: sideBarHeaderTxtColor,
    fontSize: 20,
  ),
);
TextStyle sideBarTxtStyle = hindiFonts(
  const TextStyle(
    color: sideBarTxtColor,
    fontSize: 18,
  ),
);
TextStyle aboutTxtStyle = engFonts(
  const TextStyle(
    color: aboutTxtColor,
    fontSize: 18,
  ),
);
TextStyle exitHeadTxtStyle = engFonts(
  const TextStyle(
    color: textColor,
    decoration: TextDecoration.none,
    fontSize: 20,
  ),
);
TextStyle exitTxtStyle = hindiFonts(
  const TextStyle(
    color: textColor,
    decoration: TextDecoration.none,
    fontSize: 18,
  ),
);
TextStyle diHeadTxtStyle = engFonts(
  const TextStyle(
    color: textColor,
    decoration: TextDecoration.none,
    fontSize: 22,
  ),
);
TextStyle diTxtStyle = engFonts(
  const TextStyle(
    color: textColor,
    decoration: TextDecoration.none,
    fontSize: 18,
  ),
);
TextStyle ipBoxTxtStyle = hindiFonts(
  const TextStyle(
    color: ipBoxTxtColor,
    decoration: TextDecoration.none,
    fontSize: 18,
  ),
);
TextStyle userInfoHeadingTxtStyle = engFonts(
  const TextStyle(
    color: userInfoHeadingTxtColor,
    decoration: TextDecoration.none,
    fontSize: 22,
  ),
);

//Hindi TextStyles
TextStyle hindiHeadingTxtStyle = hindiFonts(
  const TextStyle(
    color: headingTxtColor,
    fontWeight: FontWeight.w600,
    fontSize: 20,
  ),
);
TextStyle hindiNormalTextStyle = hindiFonts(
  const TextStyle(
    color: textColor,
    fontSize: 18,
  ),
);
TextStyle hindiAppBarTxtStyle = hindiFonts(
  const TextStyle(
    color: appBarTxtColor,
    fontSize: 20,
  ),
);
TextStyle buttonTxtStyle = hindiFonts(
  const TextStyle(
    color: buttonTxtColor,
    fontSize: 18,
  ),
);
TextStyle hindiButtonTxtStyle = hindiFonts(
  const TextStyle(
    color: buttonTxtColor,
    fontSize: 18,
  ),
);
TextStyle cardTxtStyle = hindiFonts(
  const TextStyle(
    color: cardTxtColor,
    fontSize: 19,
  ),
);
TextStyle yojDescHeadingStyle = hindiFonts(
  const TextStyle(
    color: yojDescTxtColor,
    fontSize: 18,
  ),
);
TextStyle yojDescTxtStyle = hindiFonts(
  const TextStyle(
    color: yojDescTxtColor,
    fontSize: 18,
    letterSpacing: 2,
  ),
);
TextStyle noYojEleHeadTxtStyle = hindiFonts(
  const TextStyle(
    color: yojDescTxtColor,
    decoration: TextDecoration.none,
    fontSize: 20,
  ),
);
TextStyle noYojEleTxtStyle = hindiFonts(
  const TextStyle(
    decoration: TextDecoration.none,
    color: yojDescTxtColor,
    fontSize: 18,
  ),
);
TextStyle fabTxtStyle = hindiFonts(
  const TextStyle(
    color: whiteColor,
    fontSize: 18,
  ),
);
