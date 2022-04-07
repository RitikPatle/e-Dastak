// ignore_for_file: prefer_typing_uninitialized_variables, duplicate_ignore
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:e_dastak/configuration_files/constants.dart';

class SurveyQueWidget extends StatelessWidget {
  final String question;
  final onPressedFn;
  final speakButFn;
  final int response;
  final String logo;
  const SurveyQueWidget({
    Key? key,
    required this.question,
    this.onPressedFn,
    required this.logo,
    this.speakButFn,
    required this.response,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Image.network(
            logo,
            loadingBuilder: (ctx, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(loaderColor),
                  ),
                );
              }
            },
            errorBuilder: (context, exception, stackTrace) {
              // print("Image Exception: $exception");
              // print("Image StackTrace: $stackTrace");
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(loaderColor),
                ),
              );
            },
          ),
        ),
        Expanded(
          flex: 7,
          child: Column(
            children: [
              Text(
                question,
                maxLines: 10,
                textAlign: TextAlign.justify,
                style: hindiHeadingTxtStyle,
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: speakButFn,
                      icon: const Icon(
                        Icons.volume_up,
                        color: iconColor,
                      )),
                  const SizedBox(
                    width: 7,
                  ),
                  ToggleSwitch(
                    totalSwitches: 2,
                    icons: const [Icons.check, Icons.close],
                    labels: const [yesButVar, noButVar],
                    iconSize: 18.0,
                    fontSize: 18.0,
                    minWidth: 80.0,
                    minHeight: 40.0,
                    borderWidth: 1.1,
                    cornerRadius: 10.0,
                    initialLabelIndex: response,
                    activeFgColor: toggleButtonActiveTxtColor,
                    inactiveBgColor: buttonBgColor,
                    inactiveFgColor: toggleButtonInActiveTxtColor,
                    dividerColor: buttonBorderColor,
                    borderColor: const [buttonBorderColor],
                    activeBgColors: const [
                      [Colors.green],
                      [Colors.red],
                    ],
                    onToggle: onPressedFn,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class YojnaQueOne extends StatelessWidget {
  final String question;
  final onButSpeak;
  final onPressedFn;
  final int respVar;
  const YojnaQueOne(
      {Key? key,
      required this.question,
      this.onPressedFn,
      this.onButSpeak,
      required this.respVar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 9,
              child: Text(
                question,
                maxLines: 3,
                textAlign: TextAlign.justify,
                style: hindiHeadingTxtStyle,
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                icon: const Icon(
                  Icons.volume_up,
                  color: iconColor,
                ),
                onPressed: onButSpeak,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ToggleSwitch(
              totalSwitches: 2,
              icons: const [Icons.check, Icons.close],
              labels: const [yesButVar, noButVar],
              iconSize: 18.0,
              fontSize: 18.0,
              minWidth: 80.0,
              minHeight: 40.0,
              borderWidth: 1.1,
              cornerRadius: 10.0,
              initialLabelIndex: respVar,
              activeFgColor: toggleButtonActiveTxtColor,
              inactiveBgColor: buttonBgColor,
              inactiveFgColor: toggleButtonInActiveTxtColor,
              dividerColor: buttonBorderColor,
              borderColor: const [buttonBorderColor],
              activeBgColors: const [
                [Colors.green],
                [Colors.red],
              ],
              onToggle: onPressedFn,
            ),
          ],
        ),
      ],
    );
  }
}

class YojnaQueTwo extends StatelessWidget {
  final question;
  final onPressedFn;
  final onButSpeak;
  final int respVar;
  const YojnaQueTwo(
      {Key? key,
      required this.onPressedFn,
      required this.question,
      this.onButSpeak,
      required this.respVar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 9,
              child: Text(
                question,
                maxLines: 3,
                textAlign: TextAlign.justify,
                style: hindiHeadingTxtStyle,
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                icon: const Icon(
                  Icons.volume_up,
                  color: iconColor,
                ),
                onPressed: onButSpeak,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ToggleSwitch(
              totalSwitches: 2,
              icons: const [Icons.check, Icons.close],
              labels: const [yesButVar, noButVar],
              iconSize: 18.0,
              fontSize: 18.0,
              minWidth: 80.0,
              minHeight: 40.0,
              borderWidth: 1.1,
              cornerRadius: 10.0,
              initialLabelIndex: respVar,
              activeFgColor: toggleButtonActiveTxtColor,
              inactiveBgColor: buttonBgColor,
              inactiveFgColor: toggleButtonInActiveTxtColor,
              dividerColor: buttonBorderColor,
              borderColor: const [buttonBorderColor],
              activeBgColors: const [
                [Colors.green],
                [Colors.red],
              ],
              onToggle: onPressedFn,
            ),
          ],
        ),
      ],
    );
  }
}

class YojnaLinkQue extends StatelessWidget {
  final questionData;
  final buttonName;
  final onPressed;
  final onButSpeak;
  const YojnaLinkQue(
      {Key? key,
      this.onPressed,
      required this.buttonName,
      this.questionData,
      this.onButSpeak})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 9,
              child: Text(
                questionData,
                maxLines: 3,
                textAlign: TextAlign.justify,
                style: hindiHeadingTxtStyle,
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                icon: const Icon(
                  Icons.volume_up,
                  color: iconColor,
                ),
                onPressed: onButSpeak,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MaterialButton(
              child: Text(
                buttonName,
                style: buttonTxtStyle,
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                side: BorderSide(color: buttonBorderColor),
              ),
              padding: const EdgeInsets.all(10),
              onPressed: onPressed,
            ),
          ],
        ),
      ],
    );
  }
}

class YojnaLinkQueWithButton extends StatelessWidget {
  final questionData;
  final respVar;
  final buttonTwoName;
  final onPressedOne;
  final onPressedTwo;
  final onButSpeak;
  final buttonTwoIcon;
  const YojnaLinkQueWithButton(
      {Key? key,
      this.buttonTwoIcon,
      this.onPressedOne,
      this.onPressedTwo,
      required this.buttonTwoName,
      this.questionData,
      this.onButSpeak,
      this.respVar})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 9,
              child: Text(
                questionData,
                maxLines: 3,
                textAlign: TextAlign.justify,
                style: hindiHeadingTxtStyle,
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                icon: const Icon(
                  Icons.volume_up,
                  color: iconColor,
                ),
                onPressed: onButSpeak,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Wrap(
          alignment: WrapAlignment.end,
          spacing: 10,
          runSpacing: 10,
          children: [
            ToggleSwitch(
              totalSwitches: 2,
              icons: const [Icons.check, Icons.close],
              labels: const [yesButVar, noButVar],
              iconSize: 18.0,
              fontSize: 18.0,
              minWidth: 80.0,
              minHeight: 40.0,
              borderWidth: 1.1,
              cornerRadius: 10.0,
              initialLabelIndex: respVar,
              activeFgColor: toggleButtonActiveTxtColor,
              inactiveBgColor: buttonBgColor,
              inactiveFgColor: toggleButtonInActiveTxtColor,
              dividerColor: buttonBorderColor,
              borderColor: const [buttonBorderColor],
              activeBgColors: const [
                [Colors.green],
                [Colors.red],
              ],
              onToggle: onPressedOne,
            ),
            MaterialButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    buttonTwoIcon,
                    color: iconColor,
                  ),
                  Text(
                    buttonTwoName,
                    style: buttonTxtStyle,
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
              onPressed: onPressedTwo,
            ),
          ],
        ),
      ],
    );
  }
}
