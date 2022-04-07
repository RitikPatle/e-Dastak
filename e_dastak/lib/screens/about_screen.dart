import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:e_dastak/configuration_files/sidebar.dart';
import 'package:e_dastak/configuration_files/constants.dart';
import 'package:http/http.dart' as http;

class AboutScreenLoading extends StatefulWidget {
  const AboutScreenLoading({Key? key}) : super(key: key);

  @override
  State<AboutScreenLoading> createState() => _AboutScreenLoadingState();
}

class _AboutScreenLoadingState extends State<AboutScreenLoading> {
  @override
  void initState() {
    getDevelopersData().whenComplete(
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => AboutScreen(
              companyUrl: companyUrl,
              logoUrl: logoUrl,
              devMail: devMail,
              devText: devText,
              compName: compName,
              vssMail: vssMail,
              vssGoogleForm: vssGoogleForm,
            ),
          ),
        );
      },
    );
    super.initState();
  }

  String companyUrl = "";
  String logoUrl = "";
  String devText = "";
  String devMail = "";
  String compName = "";
  String vssMail = "";
  String vssGoogleForm = "";
  Future getDevelopersData() async {
    var url = Uri.http(
      uriAuthority,
      '/api/settings',
    );
    var response = await http.get(
      url,
      headers: {
        'accept': 'application/json',
        'content-type': 'application/json',
      },
    );
    var jsonData = jsonDecode(response.body);
    companyUrl = jsonData['data'][0]['value'];
    logoUrl = jsonData['data'][1]['value'];
    devText = jsonData['data'][2]['value'];
    devMail = jsonData['data'][3]['value'];
    compName = jsonData['data'][4]['value'];
    vssMail = jsonData['data'][5]['value'];
    vssGoogleForm = jsonData['data'][6]['value'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: LoadingAnimationWidget.staggeredDotsWave(
          color: getLoaderColor(),
          size: 100,
        ),
      ),
    );
  }
}

class AboutScreen extends StatefulWidget {
  const AboutScreen({
    Key? key,
    required this.companyUrl,
    required this.logoUrl,
    required this.devText,
    required this.devMail,
    required this.compName,
    required this.vssMail,
    required this.vssGoogleForm,
  }) : super(key: key);

  final String companyUrl;
  final String logoUrl;
  final String devText;
  final String devMail;
  final String compName;
  final String vssMail;
  final String vssGoogleForm;

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
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
      drawer: const OtherScreensSideBar(),
      body: Container(
        decoration: backgroundsColor,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.only(
          left: 13,
          right: 13,
          top: 13,
          bottom: 13,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  appLogo,
                ),
                Text(
                  appName,
                  style: exitHeadTxtStyle,
                  textAlign: TextAlign.center,
                ),
                MaterialButton(
                  minWidth: aboutButtonWidth,
                  child: Text(
                    "VSS की वेबसाइट पर जाएं",
                    style: buttonTxtStyle,
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    side: BorderSide(color: buttonBorderColor),
                  ),
                  padding: const EdgeInsets.all(8),
                  onPressed: () {
                    launch("https://vssmp.org/");
                  },
                ),
                MaterialButton(
                  minWidth: aboutButtonWidth,
                  child: Text(
                    "ईमेल के माध्यम से संपर्क करें",
                    style: buttonTxtStyle,
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    side: BorderSide(color: buttonBorderColor),
                  ),
                  padding: const EdgeInsets.all(8),
                  onPressed: () {
                    launch("mailto:${widget.vssMail}");
                  },
                ),
                MaterialButton(
                  minWidth: aboutButtonWidth,
                  child: Text(
                    "प्राइवेसी पॉलिसी जाने",
                    style: buttonTxtStyle,
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    side: BorderSide(color: buttonBorderColor),
                  ),
                  padding: const EdgeInsets.all(8),
                  onPressed: () {
                    launch("https://sites.google.com/view/edastakvss/");
                  },
                ),
                MaterialButton(
                  minWidth: aboutButtonWidth,
                  child: Text(
                    "नियम और शर्तें जानें",
                    style: buttonTxtStyle,
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    side: BorderSide(color: buttonBorderColor),
                  ),
                  padding: const EdgeInsets.all(8),
                  onPressed: () {
                    launch("https://sites.google.com/view/edastakvss/");
                  },
                ),
                // MaterialButton(
                //   minWidth: aboutButtonWidth,
                //   child: Text(
                //     "डेवलपर्स के बारे में जाने",
                //     style: buttonTxtStyle,
                //   ),
                //   shape: const RoundedRectangleBorder(
                //     borderRadius: BorderRadius.all(
                //       Radius.circular(10.0),
                //     ),
                //     side: BorderSide(color: buttonBorderColor),
                //   ),
                //   padding: const EdgeInsets.all(8),
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => DeveloperInfoScreen(
                //           companyUrl: widget.companyUrl,
                //           logoUrl: widget.logoUrl,
                //           devMail: widget.devMail,
                //           devText: widget.devText,
                //           compName: widget.compName,
                //         ),
                //       ),
                //     );
                //   },
                // ),
                MaterialButton(
                  minWidth: aboutButtonWidth,
                  child: Text(
                    "हमारा फीडबैक फॉर्म भरें",
                    style: buttonTxtStyle,
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    side: BorderSide(color: buttonBorderColor),
                  ),
                  padding: const EdgeInsets.all(8),
                  onPressed: () {
                    launch(widget.vssGoogleForm);
                  },
                ),
                MaterialButton(
                  minWidth: aboutButtonWidth,
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
                  padding: const EdgeInsets.all(8),
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
