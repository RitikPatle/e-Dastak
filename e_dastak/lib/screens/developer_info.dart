import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:e_dastak/configuration_files/constants.dart';

class DeveloperInfoScreen extends StatefulWidget {
  const DeveloperInfoScreen({
    Key? key,
    required this.companyUrl,
    required this.logoUrl,
    required this.devText,
    required this.devMail,
    required this.compName,
  }) : super(key: key);

  final String companyUrl;
  final String logoUrl;
  final String devText;
  final String devMail;
  final String compName;

  @override
  State<DeveloperInfoScreen> createState() => _DeveloperInfoScreenState();
}

class _DeveloperInfoScreenState extends State<DeveloperInfoScreen> {
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
      body: Container(
        color: backgroundColor,
        padding: const EdgeInsets.all(23),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(widget.logoUrl),
            Text(
              widget.compName,
              style: diHeadTxtStyle,
            ),
            Text(
              widget.devText,
              textAlign: TextAlign.center,
              style: diTxtStyle,
              maxLines: 3,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      side: BorderSide(color: buttonBorderColor),
                    ),
                    onPressed: () {
                      launch(widget.companyUrl);
                    },
                    child: SizedBox(
                      // width: MediaQuery.of(context).size.width / 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.web_rounded,
                            color: iconColor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Visit Our Website",
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
                      launch("mailto:${widget.devMail}");
                    },
                    child: SizedBox(
                      // width: MediaQuery.of(context).size.width / 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.mail_outline,
                            color: iconColor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "e-Mail Us",
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
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.arrow_back_sharp,
                          color: iconColor,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Back",
                          style: buttonTxtStyle,
                        ),
                      ],
                    ),
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
