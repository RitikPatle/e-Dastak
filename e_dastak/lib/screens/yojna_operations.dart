import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:e_dastak/configuration_files/services.dart';
import 'package:e_dastak/configuration_files/constants.dart';
import 'package:e_dastak/configuration_files/custom_components.dart';
import 'package:webview_flutter/webview_flutter.dart';

class QueYojna extends StatefulWidget {
  final int yojnaDataIndex;
  const QueYojna({Key? key, required this.yojnaDataIndex}) : super(key: key);

  @override
  State<QueYojna> createState() => _QueYojnaState();
}

class _QueYojnaState extends State<QueYojna> {
  final _flutterTts = FlutterTts();

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

  int getYojRespOne(yojnaIndexVar) {
    var rawResp = yojnaDataList[yojnaIndexVar]['responses'];
    int numResp;
    try {
      if (rawResp[0]['answer'] == 'yes') {
        numResp = 0;
      } else if (rawResp[0]['answer'] == 'no') {
        numResp = 1;
      } else {
        numResp = 2;
      }
    } catch (e) {
      numResp = 2;
    }
    return numResp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          yojnaDataList[widget.yojnaDataIndex]['yojna_name'],
          style: hindiAppBarTxtStyle,
        ),
        backgroundColor: appBarBgColor,
        centerTitle: true,
        leading: const Icon(
          Icons.apps_sharp,
          color: appBarIconColor,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              color: appBarIconColor,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: backgroundsColor,
        width: double.infinity,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            "क्या आप ${yojnaDataList[widget.yojnaDataIndex]['yojna_name']} के बारे में जानते हैं?",
                            maxLines: 3,
                            textAlign: TextAlign.justify,
                            style: hindiHeadingTxtStyle,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.volume_up,
                            color: iconColor,
                          ),
                          onPressed: () {
                            stop();
                            speak(
                              "क्या आप ${yojnaDataList[widget.yojnaDataIndex]['yojna_name']} के बारे में जानते हैं? योजना का उद्देश्य : ${yojnaDataList[widget.yojnaDataIndex]['aim']} योजना से लाभ : ${yojnaDataList[widget.yojnaDataIndex]['profit']}",
                            );
                          },
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Divider(
                        height: 10,
                        thickness: 1.0,
                        color: dividerColor,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2.5,
                  padding: const EdgeInsets.only(
                    left: 7,
                    right: 7,
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: "योजना का उद्देश्य :\n",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: yojDescHeadingTxtColor,
                                fontSize: 24,
                              ),
                            ),
                            TextSpan(
                              text:
                                  "${yojnaDataList[widget.yojnaDataIndex]['aim']}",
                              style: yojDescTxtStyle,
                            ),
                            const TextSpan(
                              text: "\n\nयोजना से लाभ :\n",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: yojDescHeadingTxtColor,
                                fontSize: 24,
                              ),
                            ),
                            TextSpan(
                              text:
                                  "${yojnaDataList[widget.yojnaDataIndex]['profit']}",
                              style: yojDescTxtStyle,
                            ),
                            const TextSpan(
                              text:
                                  "\n\nअधिक जानकारी के लिए इस लिंक पर क्लिक करें :\n",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: yojDescHeadingTxtColor,
                                fontSize: 24,
                              ),
                            ),
                            TextSpan(
                              text:
                                  "${yojnaDataList[widget.yojnaDataIndex]['yojLink']}",
                              style: yojDescTxtStyle,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  var url =
                                      "${yojnaDataList[widget.yojnaDataIndex]['yojLink']}";
                                  await launch(url);
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const Divider(
                      height: 15,
                      thickness: 1,
                      color: dividerColor,
                    ),
                    YojnaQueOne(
                      question: 'क्या आपको योजना के तहत लाभ प्राप्त हो रहा है?',
                      onButSpeak: () {
                        stop();
                        speak(
                          "क्या आपको ${yojnaDataList[widget.yojnaDataIndex]['yojna_name']} के तहत लाभ प्राप्त हो रहा है?",
                        );
                      },
                      onPressedFn: (fnIndex) {
                        String result;
                        if (fnIndex == 0) {
                          result = "yes";
                          sendSchemeRes(
                            yojnaDataList[widget.yojnaDataIndex]['yojnaid'],
                            "क्या आपको ${yojnaDataList[widget.yojnaDataIndex]['yojna_name']} के तहत लाभ प्राप्त हो रहा है?",
                            result,
                          );
                        } else {
                          result = "no";
                          sendSchemeRes(
                            yojnaDataList[widget.yojnaDataIndex]['yojnaid'],
                            "क्या आपको ${yojnaDataList[widget.yojnaDataIndex]['yojna_name']} के तहत लाभ प्राप्त हो रहा है?",
                            result,
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => YojnaOptions(
                                  yojnaDataIndex: widget.yojnaDataIndex),
                            ),
                          );
                        }
                      },
                      respVar: getYojRespOne(widget.yojnaDataIndex),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 45,
                  child: MaterialButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.arrow_back_ios,
                          color: iconColor,
                        ),
                        Text(
                          "पिछले पेज पर जाए",
                          style: buttonTxtStyle,
                        ),
                        IconButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: () {
                            stop();
                            speak(
                              "पिछले पेज पर जाए",
                            );
                          },
                          icon: const Icon(
                            Icons.volume_up,
                            color: iconColor,
                          ),
                        ),
                      ],
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      side: BorderSide(color: buttonBorderColor),
                    ),
                    padding: const EdgeInsets.all(10),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class YojnaOptions extends StatefulWidget {
  const YojnaOptions({Key? key, required this.yojnaDataIndex})
      : super(key: key);

  final int yojnaDataIndex;

  @override
  State<YojnaOptions> createState() => _YojnaOptionsState();
}

class _YojnaOptionsState extends State<YojnaOptions> {
  final _flutterTts = FlutterTts();

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

  int getYojRespTwo(yojnaIndexVar) {
    var rawResp = yojnaDataList[yojnaIndexVar]['responses'];
    int numResp;
    try {
      if (rawResp[1]['answer'] == 'yes') {
        numResp = 0;
      } else if (rawResp[1]['answer'] == 'no') {
        numResp = 1;
      } else {
        numResp = 2;
      }
    } catch (e) {
      numResp = 2;
    }
    return numResp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          yojnaDataList[widget.yojnaDataIndex]['yojna_name'],
          style: hindiAppBarTxtStyle,
        ),
        backgroundColor: appBarBgColor,
        centerTitle: true,
        leading: const Icon(
          Icons.apps_sharp,
          color: appBarIconColor,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              color: appBarIconColor,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: backgroundsColor,
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Divider(
                  height: 15,
                  thickness: 1,
                  color: dividerColor,
                ),
                YojnaQueTwo(
                  onPressedFn: (fnIndex) {
                    String result;
                    if (fnIndex == 0) {
                      result = "yes";
                      sendSchemeRes(
                        yojnaDataList[widget.yojnaDataIndex]['yojnaid'],
                        "क्या आपने ${yojnaDataList[widget.yojnaDataIndex]['yojna_name']} का लाभ पाने के लिए आवेदन कर दिया है?",
                        result,
                      );
                    } else {
                      result = "no";
                      sendSchemeRes(
                        yojnaDataList[widget.yojnaDataIndex]['yojnaid'],
                        "क्या आपने ${yojnaDataList[widget.yojnaDataIndex]['yojna_name']} का लाभ पाने के लिए आवेदन कर दिया है?",
                        result,
                      );
                    }
                  },
                  question:
                      "क्या आपने योजना का लाभ पाने के लिए आवेदन कर दिया है?",
                  onButSpeak: () {
                    stop();
                    speak(
                      "क्या आपने ${yojnaDataList[widget.yojnaDataIndex]['yojna_name']} का लाभ पाने के लिए आवेदन कर दिया है?",
                    );
                  },
                  respVar: getYojRespTwo(widget.yojnaDataIndex),
                ),
                const Divider(
                  height: 20,
                  thickness: 1,
                  color: dividerColor,
                ),
                YojnaLinkQue(
                  questionData:
                      "क्या आप योजना का लाभ पाने के लिए आवेदन करना चाहते है?",
                  buttonName: "आवेदन-लिंक",
                  onButSpeak: () {
                    stop();
                    speak(
                      "क्या आप ${yojnaDataList[widget.yojnaDataIndex]['yojna_name']} का लाभ पाने के लिए आवेदन करना चाहते है?",
                    );
                  },
                  onPressed: () {
                    var url = yojnaDataList[widget.yojnaDataIndex]['applyLink'];
                    launch(url);
                  },
                ),
                const Divider(
                  height: 20,
                  thickness: 1,
                  color: dividerColor,
                ),
                YojnaLinkQueWithButton(
                  questionData:
                      "क्या आपको योजना का लाभ पाने में कठिनाई हो रही है? शिकायत करें:",
                  respVar: 2,
                  buttonTwoName: "मुख्यमंत्री हेल्पलाइन नंबर पर\nकॉल करे",
                  onButSpeak: () {
                    stop();
                    speak(
                      "क्या आपको ${yojnaDataList[widget.yojnaDataIndex]['yojna_name']} का लाभ पाने में कठिनाई हो रही है?",
                    );
                  },
                  onPressedOne: (fnIndex) {
                    String result;
                    if (fnIndex == 0) {
                      result = "yes";
                      sendSchemeRes(
                        yojnaDataList[widget.yojnaDataIndex]['yojnaid'],
                        "क्या आपने ${yojnaDataList[widget.yojnaDataIndex]['yojna_name']} का लाभ पाने में कठिनाई हो रही है?",
                        result,
                      );
                      var url =
                          yojnaDataList[widget.yojnaDataIndex]['shikayatLink'];
                      launch(url);
                    } else {
                      result = "no";
                      sendSchemeRes(
                        yojnaDataList[widget.yojnaDataIndex]['yojnaid'],
                        "क्या आपने ${yojnaDataList[widget.yojnaDataIndex]['yojna_name']} का लाभ पाने में कठिनाई हो रही है?",
                        result,
                      );
                    }
                  },
                  onPressedTwo: () {
                    var phoneNo =
                        yojnaDataList[widget.yojnaDataIndex]['helpline'];
                    launch('tel:$phoneNo');
                  },
                  buttonTwoIcon: Icons.phone,
                ),
                const Divider(
                  height: 20,
                  thickness: 1,
                  color: dividerColor,
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 45,
                  child: MaterialButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.feedback_outlined,
                          color: iconColor,
                        ),
                        Text(
                          "फीडबैक फॉर्म भरें",
                          style: buttonTxtStyle,
                        ),
                        IconButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: () {
                            stop();
                            speak(
                              "फीडबैक फॉर्म भरें",
                            );
                          },
                          icon: const Icon(
                            Icons.volume_up,
                            color: iconColor,
                          ),
                        ),
                      ],
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      side: BorderSide(color: buttonBorderColor),
                    ),
                    onPressed: () {
                      launch(
                        "https://docs.google.com/forms/d/e/1FAIpQLSe1RwChODLEzpfDLbjNgRIHx4QMECWz_x-2obWf91XFFtticw/viewform?vc=0&c=0&w=1&flr=0",
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 45,
                  child: MaterialButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.arrow_back_ios,
                          color: iconColor,
                        ),
                        Text(
                          "पिछले पेज पर जाए",
                          style: buttonTxtStyle,
                        ),
                        IconButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: () {
                            stop();
                            speak(
                              "पिछले पेज पर जाए",
                            );
                          },
                          icon: const Icon(
                            Icons.volume_up,
                            color: iconColor,
                          ),
                        ),
                      ],
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      side: BorderSide(color: buttonBorderColor),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FeedBackWebView extends StatelessWidget {
  const FeedBackWebView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(
            child: WebView(
              initialUrl:
                  "https://docs.google.com/forms/d/e/1FAIpQLSe1RwChODLEzpfDLbjNgRIHx4QMECWz_x-2obWf91XFFtticw/viewform?vc=0&c=0&w=1&flr=0",
            ),
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
          MaterialButton(
            child: Text(
              "पिछले पेज पर जाएं",
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
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
// Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const FeedBackWebView(),
//                         ),
//                       );
