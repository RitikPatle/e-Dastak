import 'package:e_dastak/screens/loading_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:e_dastak/screens/splash_screen.dart';
import 'package:e_dastak/configuration_files/constants.dart';

class NoYojnaElement extends StatelessWidget {
  const NoYojnaElement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.all(
        30,
      ),
      child: ListView(
        children: [
          Image.asset(
            appLogo,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            appName,
            style: exitHeadTxtStyle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "क्षमा करे :",
                        style: noYojEleHeadTxtStyle,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "आप किसी भी योजना के लिए योग्य नहीं है,\nया आपने सर्वेक्षण प्रपत्र नहीं भरा है |",
                        maxLines: 3,
                        style: noYojEleTxtStyle,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15),
              MaterialButton(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  side: BorderSide(color: buttonBorderColor),
                ),
                onPressed: () {
                  surveyQueList.clear();
                  yojnaDataList.clear();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SurveyLoadingEffect(),
                    ),
                  );
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.app_registration,
                        color: iconColor,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "सर्वेक्षण प्रपत्र भरे",
                        style: buttonTxtStyle,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              MaterialButton(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  side: BorderSide(color: buttonBorderColor),
                ),
                onPressed: () {
                  surveyQueList.clear();
                  yojnaDataList.clear();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SplashScreen(),
                    ),
                  );
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
              const SizedBox(height: 15),
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
        ],
      ),
    );
  }
}
