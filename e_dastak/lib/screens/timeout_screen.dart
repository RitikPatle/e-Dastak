import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:e_dastak/screens/splash_screen.dart';
import 'package:e_dastak/configuration_files/services.dart';
import 'package:e_dastak/configuration_files/constants.dart';

class ConnTimeOutScreen extends StatelessWidget {
  const ConnTimeOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: backgroundColor,
        padding: const EdgeInsets.all(23),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(appLogo),
            Text(
              appName,
              style: exitHeadTxtStyle,
            ),
            Text(
              "कृपया अपने इंटरनेट कनेक्शन की जाँच करें.",
              textAlign: TextAlign.center,
              style: exitTxtStyle,
              maxLines: 3,
            ),
            MaterialButton(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                side: BorderSide(color: buttonBorderColor),
              ),
              onPressed: () async {
                var navigate = await checkConnOnTO();
                if (navigate == true) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SplashScreen(),
                    ),
                  );
                } else {}
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.wifi_protected_setup_sharp,
                      color: iconColor,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "पुनर्प्रारंभ करें",
                      style: buttonTxtStyle,
                    ),
                  ],
                ),
              ),
            ),
            MaterialButton(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                side: BorderSide(color: buttonBorderColor),
              ),
              onPressed: () {
                SystemNavigator.pop();
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.exit_to_app,
                      color: iconColor,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "बाहर जाएं",
                      style: buttonTxtStyle,
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
