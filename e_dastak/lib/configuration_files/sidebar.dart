import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:e_dastak/screens/user_info.dart';
import 'package:e_dastak/screens/about_screen.dart';
import 'package:e_dastak/screens/loading_screens.dart';
import 'package:e_dastak/configuration_files/constants.dart';

class HomeSideBar extends StatefulWidget {
  const HomeSideBar({Key? key}) : super(key: key);

  @override
  State<HomeSideBar> createState() => _HomeSideBarState();
}

class _HomeSideBarState extends State<HomeSideBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: sideBarBgColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: DrawerHeader(
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        color: logoBackgroundColor,
                        child: Image.asset(
                          appLogo,
                          height: 110.0,
                          width: 120.0,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    appName,
                    textAlign: TextAlign.center,
                    style: sideBarHeadingTxtStyle,
                  ),
                ],
              ),
              decoration: const BoxDecoration(
                color: sideBarHeaderBgColor,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home_outlined,
              color: sideBarIconColor,
            ),
            title: Text(
              'होम',
              style: sideBarTxtStyle,
            ),
            onTap: () => {
              Navigator.of(context).pop(),
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.app_registration,
              color: sideBarIconColor,
            ),
            title: Text(
              'सर्वेक्षण प्रपत्र भरे',
              style: sideBarTxtStyle,
            ),
            onTap: () => {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const SurveyLoadingEffect(),
                ),
              ),
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.info_outline_rounded,
              color: sideBarIconColor,
            ),
            title: Text(
              'ऐप की जानकारी',
              style: sideBarTxtStyle,
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutScreenLoading(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.exit_to_app,
              color: sideBarIconColor,
            ),
            title: Text(
              'बाहर जाएं',
              style: sideBarTxtStyle,
            ),
            onTap: () => {
              SystemNavigator.pop(),
            },
          ),
        ],
      ),
    );
  }
}

class OtherScreensSideBar extends StatefulWidget {
  const OtherScreensSideBar({Key? key}) : super(key: key);

  @override
  State<OtherScreensSideBar> createState() => _OtherScreensSideBarState();
}

class _OtherScreensSideBarState extends State<OtherScreensSideBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: sideBarBgColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: DrawerHeader(
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        color: logoBackgroundColor,
                        child: Image.asset(
                          appLogo,
                          height: 110.0,
                          width: 120.0,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    appName,
                    textAlign: TextAlign.center,
                    style: sideBarHeadingTxtStyle,
                  ),
                ],
              ),
              decoration: const BoxDecoration(
                color: sideBarHeaderBgColor,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home_outlined,
              color: sideBarIconColor,
            ),
            title: Text(
              'होम',
              style: sideBarTxtStyle,
            ),
            onTap: () => {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const EnterUserInfoScreen(),
                ),
              ),
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.app_registration,
              color: sideBarIconColor,
            ),
            title: Text(
              'सर्वेक्षण प्रपत्र भरे',
              style: sideBarTxtStyle,
            ),
            onTap: () => {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const SurveyLoadingEffect(),
                ),
              ),
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.info_outline_rounded,
              color: sideBarIconColor,
            ),
            title: Text(
              'ऐप की जानकारी',
              style: sideBarTxtStyle,
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutScreenLoading(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.exit_to_app,
              color: sideBarIconColor,
            ),
            title: Text(
              'बाहर जाएं',
              style: sideBarTxtStyle,
            ),
            onTap: () => {
              SystemNavigator.pop(),
            },
          ),
        ],
      ),
    );
  }
}
