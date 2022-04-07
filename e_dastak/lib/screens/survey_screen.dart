import 'package:e_dastak/screens/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:new_version/new_version.dart';
import 'package:e_dastak/configuration_files/services.dart';
import 'package:e_dastak/configuration_files/constants.dart';
import 'package:e_dastak/configuration_files/custom_components.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({Key? key}) : super(key: key);

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  final _flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
  }

  int retResp(fnIndex) {
    if (surveyQueList[fnIndex]['response'] == "yes") {
      return 0;
    } else if (surveyQueList[fnIndex]['response'] == "no") {
      return 1;
    } else if (surveyQueList[fnIndex]['response'] == "null") {
      return 2;
    } else {
      return 2;
    }
  }

  void speak(textVar) async {
    _flutterTts.setLanguage("hi");
    if (textVar != null) {
      await _flutterTts.speak(textVar);
    }
  }

  void stop() async {
    await _flutterTts.stop();
  }

  @override
  void dispose() {
    _flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appName,
          style: appBarTxtStyle,
        ),
        backgroundColor: appBarBgColor,
        centerTitle: true,
        leading: const Icon(
          Icons.app_registration,
          color: appBarIconColor,
        ),
      ),
      body: Container(
        decoration: backgroundsColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 5,
                left: 20,
                right: 20,
              ),
              child: const Divider(
                height: 22,
                thickness: 1.0,
                color: dividerColor,
              ),
            ),
            Expanded(
              flex: 15,
              child: Container(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 20,
                ),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SurveyQueWidget(
                          question: surveyQueList[index]['question'],
                          logo: surveyQueList[index]['image'],
                          response: retResp(index),
                          onPressedFn: (fnIndex) {
                            String result;
                            if (fnIndex == 0) {
                              result = 'yes';
                              sendQueRes(surveyQueList[index]['queid'], result);
                            } else if (fnIndex == 1) {
                              result = 'no';
                              sendQueRes(surveyQueList[index]['queid'], result);
                            } else {}
                          },
                          speakButFn: () {
                            stop();
                            speak(
                              "${surveyQueList[index]['question']}",
                            );
                          },
                        ),
                        const Divider(
                          height: 22,
                          thickness: 1.0,
                          color: dividerColor,
                        ),
                      ],
                    );
                  },
                  itemCount: surveyQueList.length,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        minWidth: MediaQuery.of(context).size.width / 3,
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
                      MaterialButton(
                        minWidth: MediaQuery.of(context).size.width / 3,
                        child: Text(
                          "आगे बढे",
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
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
