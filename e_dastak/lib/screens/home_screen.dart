import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:e_dastak/screens/no_yojna_screen.dart';
import 'package:e_dastak/screens/yojna_operations.dart';
import 'package:e_dastak/configuration_files/sidebar.dart';
import 'package:e_dastak/configuration_files/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: appBarIconColor,
        title: Text(
          appName,
          style: appBarTxtStyle,
        ),
        centerTitle: true,
        backgroundColor: appBarBgColor,
      ),
      drawer: const HomeSideBar(),
      floatingActionButton: Container(
        decoration: const ShapeDecoration(
          color: appBarBgColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: whiteColor,
              width: 2.5,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                30,
              ),
            ),
          ),
        ),
        // width: 100,
        child: MaterialButton(
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              const Icon(
                Icons.exit_to_app,
                color: whiteColor,
              ),
              Text(
                "  बाहर जाएं",
                style: fabTxtStyle,
              )
            ],
          ),
          onPressed: () {
            SystemNavigator.pop();
          },
        ),
      ),
      body: (yojnaDataList.isEmpty)
          ? const NoYojnaElement()
          : Container(
              decoration: backgroundsColor,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(
                left: 0,
                right: 0,
                top: 0,
                bottom: 13,
              ),
              child: Column(
                children: [
                  Container(
                    color: extendedAppBarColor,
                    height: 75,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text(
                        "आप निम्न योजनाओ के योग्य पात्र है",
                        maxLines: 3,
                        style: hindiAppBarTxtStyle,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 182,
                    child: ListView.builder(
                      itemCount: yojnaDataList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => QueYojna(
                                      yojnaDataIndex: index,
                                    ),
                                  ),
                                );
                              },
                              child: Card(
                                color: cardBgColor,
                                shape: const RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: cardBorderColor,
                                    width: 2.5,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30.0),
                                    bottomRight: Radius.circular(30.0),
                                  ),
                                ),
                                child: ListTile(
                                  contentPadding: const EdgeInsets.all(10),
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      50.0,
                                    ),
                                    child: Container(
                                      // padding: const EdgeInsets.all(10),
                                      color: logoBackgroundColor,
                                      child: Image.network(
                                        yojnaDataList[index]['yojna_img'],
                                        width: 60,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    "${yojnaDataList[index]['yojna_name']}",
                                    maxLines: 2,
                                    style: cardTxtStyle,
                                  ),
                                  trailing: Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    spacing: 0, // space between two icons
                                    children: <Widget>[
                                      IconButton(
                                          onPressed: () {
                                            stop();
                                            speak(
                                              "${yojnaDataList[index]['yojna_name']}",
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.volume_up,
                                            color: iconOnDarkColor,
                                          )),
                                      const Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        color: iconOnDarkColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            if (index == yojnaDataList.length - 1)
                              const SizedBox(
                                height: 50,
                              ),
                          ],
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
//child: Container(
//                                 decoration: const ShapeDecoration(
//                                   color: cardBgColor,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(30.0),
//                                       bottomRight: Radius.circular(30.0),
//                                     ),
//                                   ),
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     Expanded(
//                                       flex: 8,
//                                       child: Column(
//                                         children: [
//                                           const SizedBox(
//                                             height: 10,
//                                           ),
//                                           Image.network(
//                                             yojnaDataList[index]['yojna_img'],
//                                             height: 100,
//                                           ),
//                                           const SizedBox(
//                                             height: 5,
//                                           ),
//                                           Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               IconButton(
//                                                   onPressed: () {
//                                                     stop();
//                                                     speak(
//                                                       "${yojnaDataList[index]['yojna_name']}",
//                                                     );
//                                                   },
//                                                   icon: const Icon(
//                                                     Icons.volume_up,
//                                                     color: iconOnDarkColor,
//                                                   )),
//                                               Expanded(
//                                                 child: Text(
//                                                   "${yojnaDataList[index]['yojna_name']}",
//                                                   maxLines: 3,
//                                                   style: cardTxtStyle,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           const SizedBox(
//                                             height: 5,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     const Expanded(
//                                       child: Icon(
//                                         Icons.arrow_forward_ios_sharp,
//                                         color: iconOnDarkColor,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
