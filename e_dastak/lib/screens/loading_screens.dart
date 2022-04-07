import 'package:flutter/material.dart';
import 'package:e_dastak/screens/home_screen.dart';
import 'package:e_dastak/screens/survey_screen.dart';
import 'package:e_dastak/configuration_files/services.dart';
import 'package:e_dastak/configuration_files/constants.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomeLoadingEffect extends StatefulWidget {
  const HomeLoadingEffect({
    Key? key,
    required this.usrName,
    required this.mobileNo,
    required this.samudai,
    required this.eVolunteer,
    required this.jilaSamanvay,
    required this.blockSamanvay,
    required this.anya,
    required this.villageName,
    required this.panchayatName,
    required this.districtName,
  }) : super(key: key);
  final String usrName;
  final String mobileNo;
  final bool samudai;
  final bool eVolunteer;
  final bool jilaSamanvay;
  final bool blockSamanvay;
  final bool anya;
  final String villageName;
  final String panchayatName;
  final String districtName;
  @override
  _HomeLoadingEffectState createState() => _HomeLoadingEffectState();
}

class _HomeLoadingEffectState extends State<HomeLoadingEffect> {
  Future homePageFn(
    usrName,
    mobileNo,
    samudai,
    eVolunteer,
    jilaSamanvay,
    blockSamanvay,
    anya,
    villageName,
    panchayatName,
    districtName,
  ) async {
    try {
      await getHomePageData(
              usrName,
              mobileNo,
              samudai,
              eVolunteer,
              jilaSamanvay,
              blockSamanvay,
              anya,
              villageName,
              panchayatName,
              districtName)
          .whenComplete(
        () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        ),
      );
    } catch (e) {
      () {};
    }
  }

  @override
  void initState() {
    homePageFn(
      widget.usrName,
      widget.mobileNo,
      widget.samudai,
      widget.eVolunteer,
      widget.jilaSamanvay,
      widget.blockSamanvay,
      widget.anya,
      widget.villageName,
      widget.panchayatName,
      widget.districtName,
    );
    super.initState();
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

class SurveyLoadingEffect extends StatefulWidget {
  const SurveyLoadingEffect({Key? key}) : super(key: key);
  @override
  _SurveyLoadingEffectState createState() => _SurveyLoadingEffectState();
}

class _SurveyLoadingEffectState extends State<SurveyLoadingEffect> {
  Future surveyPageFn() async {
    try {
      surveyQueList.clear();
      await getSurveyPageData().whenComplete(
        () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const SurveyScreen(),
          ),
        ),
      );
    } catch (e) {
      () {};
    }
  }

  @override
  void initState() {
    surveyPageFn();
    super.initState();
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
