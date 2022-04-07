import 'package:flutter/material.dart';
import 'package:e_dastak/screens/loading_screens.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:e_dastak/configuration_files/constants.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class EnterUserInfoScreen extends StatefulWidget {
  const EnterUserInfoScreen({Key? key}) : super(key: key);

  @override
  State<EnterUserInfoScreen> createState() => _EnterUserInfoScreenState();
}

class _EnterUserInfoScreenState extends State<EnterUserInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return const LoadSpData();
  }
}

class LoadSpData extends StatefulWidget {
  const LoadSpData({Key? key}) : super(key: key);

  @override
  State<LoadSpData> createState() => _LoadSpDataState();
}

class _LoadSpDataState extends State<LoadSpData> {
  String userName = "";
  String mobileNo = "";
  String villName = "";
  String panName = "";
  String distName = "";

  Future getUserNameFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    final uName = prefs.getString('user_name');
    if (uName == null) {
      return "";
    } else {
      return uName;
    }
  }

  Future getMobileNoFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    final mNo = prefs.getString('mobile_no');
    if (mNo == null) {
      return "";
    } else {
      return mNo;
    }
  }

  Future getVillageNameFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    final vName = prefs.getString('village_name');
    if (vName == null) {
      return "";
    } else {
      return vName;
    }
  }

  Future getPanchayatNameFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    final pName = prefs.getString('panchayat_name');
    if (pName == null) {
      return "";
    } else {
      return pName;
    }
  }

  Future getDistrictNameFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    final dName = prefs.getString('district_name');
    if (dName == null) {
      return "";
    } else {
      return dName;
    }
  }

  @override
  void initState() {
    super.initState();
    getUserNameFromSharedPref().then(
      (un) {
        userName = un;
        getMobileNoFromSharedPref().then(
          (mn) {
            mobileNo = mn;
            getVillageNameFromSharedPref().then((vName) {
              villName = vName;
              getPanchayatNameFromSharedPref().then((pName) {
                panName = pName;
                getDistrictNameFromSharedPref().then((dName) {
                  distName = dName;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OnDataLoadOfSf(
                        uName: userName,
                        mNumber: mobileNo,
                        villageName: villName,
                        panchayatName: panName,
                        districtName: distName,
                      ),
                    ),
                  );
                });
              });
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: backgroundOpaqueColor,
      body: Container(
        decoration: backgroundsColor,
        child: Center(
          child: LoadingAnimationWidget.staggeredDotsWave(
            color: getLoaderColor(),
            size: 100,
          ),
        ),
      ),
    );
  }
}

class OnDataLoadOfSf extends StatefulWidget {
  const OnDataLoadOfSf({
    Key? key,
    required this.uName,
    required this.mNumber,
    required this.villageName,
    required this.panchayatName,
    required this.districtName,
  }) : super(key: key);
  final String uName;
  final String mNumber;
  final String villageName;
  final String panchayatName;
  final String districtName;

  @override
  State<OnDataLoadOfSf> createState() => _OnDataLoadOfSfState();
}

class _OnDataLoadOfSfState extends State<OnDataLoadOfSf> {
  String userName = "";
  String mobileNo = "";
  String villageName = "";
  String panchayatName = "";
  String districtName = "";
  Future storeUserNameAndNo(usName, mileNo, vlName, ptName, dtName) async {
    await setUserNameInSharedPrefrences(usName);
    await setMobileNoInSharedPrefrences(mileNo);
    await setVillageNameInSharedPrefrences(vlName);
    await setPanchayatNameInSharedPrefrences(ptName);
    await setDistrictNameInSharedPrefrences(dtName);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeLoadingEffect(
          usrName: userName,
          mobileNo: mobileNo,
          samudai: smaudai,
          eVolunteer: evolunteer,
          jilaSamanvay: jilaSamanvay,
          blockSamanvay: blockSmanvay,
          anya: anya,
          villageName: villageName,
          panchayatName: panchayatName,
          districtName: districtName,
        ),
      ),
    );
  }

  Future setUserNameInSharedPrefrences(usrName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_name', usrName);
  }

  Future setMobileNoInSharedPrefrences(mobileNo) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('mobile_no', mobileNo);
  }

  Future setVillageNameInSharedPrefrences(villageName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('village_name', villageName);
  }

  Future setPanchayatNameInSharedPrefrences(panchayatName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('panchayat_name', panchayatName);
  }

  Future setDistrictNameInSharedPrefrences(districtName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('district_name', districtName);
  }

  @override
  void initState() {
    setState(() {
      userName = widget.uName;
      mobileNo = widget.mNumber;
      villageName = widget.villageName;
      panchayatName = widget.panchayatName;
      districtName = widget.districtName;
    });
    super.initState();
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool smaudai = false;
  bool evolunteer = false;
  bool jilaSamanvay = false;
  bool blockSmanvay = false;
  bool anya = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: backgroundsColor,
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          alignment: Alignment.center,
          child: Form(
            key: _formkey,
            child: ListView(
              shrinkWrap: true,
              children: [
                Image.asset(
                  appLogo,
                  height: 100,
                  width: 100,
                ),
                const SizedBox(height: 12),
                Text(
                  appName,
                  textAlign: TextAlign.center,
                  style: userInfoHeadingTxtStyle,
                ),
                const SizedBox(height: 12),
                Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                  child: ListView(
                    children: [
                      const SizedBox(height: 12),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        initialValue: userName,
                        onChanged: (value) {
                          setState(() {
                            userName = value;
                          });
                        },
                        style: ipBoxTxtStyle,
                        cursorColor: ipBoxBorderColor,
                        decoration: InputDecoration(
                          labelText: "आपका नाम",
                          labelStyle: ipBoxTxtStyle,
                          prefixIcon: const Icon(
                            Icons.person,
                            color: ipBoxTxtColor,
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ipBoxBorderColor, width: 2.0),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ipBoxBorderColor, width: 2.0),
                          ),
                          fillColor: ipBoxBorderColor,
                        ),
                        validator: (value) {
                          if (value == "") {
                            return 'कृपया अपना नाम भरे.';
                          }
                          if (RegExp(r"[0-9]+").hasMatch(value!)) {
                            return 'कृपया अपना नाम ठीक से भरे.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        initialValue: mobileNo,
                        style: ipBoxTxtStyle,
                        cursorColor: ipBoxBorderColor,
                        decoration: InputDecoration(
                          labelText: "मोबाइल नंबर",
                          labelStyle: ipBoxTxtStyle,
                          prefix: const Text(
                            "+91 ",
                            style: TextStyle(
                              color: ipBoxTxtColor,
                              decoration: TextDecoration.none,
                              fontSize: 18,
                            ),
                          ),
                          prefixIcon: const Icon(
                            Icons.phone_android,
                            color: ipBoxTxtColor,
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ipBoxBorderColor, width: 2.0),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ipBoxBorderColor, width: 2.0),
                          ),
                          fillColor: ipBoxBorderColor,
                        ),
                        validator: (value) {
                          if (value == "") {
                            return 'कृपया अपना मोबाइल नंबर भरे.';
                          }
                          if (!RegExp(r"(\d){10,10}").hasMatch(value!)) {
                            return 'कृपया अपना मोबाइल नंबर ठीक से भरे.';
                          }
                          if (value.length > 10) {
                            return 'कृपया अपना मोबाइल नंबर ठीक से भरे.';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            mobileNo = value;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        initialValue: villageName,
                        style: ipBoxTxtStyle,
                        cursorColor: ipBoxBorderColor,
                        decoration: InputDecoration(
                          labelText: "गाँव का नाम",
                          labelStyle: ipBoxTxtStyle,
                          prefixIcon: const Icon(
                            Icons.holiday_village,
                            color: ipBoxTxtColor,
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ipBoxBorderColor, width: 2.0),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ipBoxBorderColor, width: 2.0),
                          ),
                          fillColor: ipBoxBorderColor,
                        ),
                        validator: (value) {
                          if (value == "") {
                            return 'कृपया गाँव का नाम भरे.';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            villageName = value;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        initialValue: panchayatName,
                        style: ipBoxTxtStyle,
                        cursorColor: ipBoxBorderColor,
                        decoration: InputDecoration(
                          labelText: "पंचायत का नाम",
                          labelStyle: ipBoxTxtStyle,
                          prefixIcon: const Icon(
                            Icons.edit,
                            color: ipBoxTxtColor,
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ipBoxBorderColor, width: 2.0),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ipBoxBorderColor, width: 2.0),
                          ),
                          fillColor: ipBoxBorderColor,
                        ),
                        validator: (value) {
                          if (value == "") {
                            return 'कृपया पंचायत का नाम भरे.';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            panchayatName = value;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        initialValue: districtName,
                        style: ipBoxTxtStyle,
                        cursorColor: ipBoxBorderColor,
                        decoration: InputDecoration(
                          labelText: "जिले का नाम",
                          labelStyle: ipBoxTxtStyle,
                          prefixIcon: const Icon(
                            Icons.edit,
                            color: ipBoxTxtColor,
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ipBoxBorderColor, width: 2.0),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ipBoxBorderColor, width: 2.0),
                          ),
                          fillColor: ipBoxBorderColor,
                        ),
                        validator: (value) {
                          if (value == "") {
                            return 'कृपया जिले का नाम भरे.';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            districtName = value;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        children: [
                          Wrap(
                            children: [
                              MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    smaudai = (smaudai) ? false : true;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Theme(
                                      data: ThemeData(
                                          unselectedWidgetColor:
                                              ipBoxBorderColor),
                                      child: Checkbox(
                                        value: smaudai,
                                        activeColor: ipBoxTxtColor,
                                        onChanged: (chkValue) {},
                                      ),
                                    ),
                                    Text(
                                      "समुदाय",
                                      style: ipBoxTxtStyle,
                                    ),
                                  ],
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    evolunteer = (evolunteer) ? false : true;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Theme(
                                      data: ThemeData(
                                          unselectedWidgetColor:
                                              ipBoxBorderColor),
                                      child: Checkbox(
                                        value: evolunteer,
                                        activeColor: ipBoxTxtColor,
                                        onChanged: (chkValue) {},
                                      ),
                                    ),
                                    Text(
                                      "ई-वालंटियर",
                                      style: ipBoxTxtStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Wrap(
                            children: [
                              MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    jilaSamanvay =
                                        (jilaSamanvay) ? false : true;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Theme(
                                      data: ThemeData(
                                          unselectedWidgetColor:
                                              ipBoxBorderColor),
                                      child: Checkbox(
                                        value: jilaSamanvay,
                                        activeColor: ipBoxTxtColor,
                                        onChanged: (chkValue) {},
                                      ),
                                    ),
                                    Text(
                                      "जिला समन्वय",
                                      style: ipBoxTxtStyle,
                                    ),
                                  ],
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    blockSmanvay =
                                        (blockSmanvay) ? false : true;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Theme(
                                      data: ThemeData(
                                          unselectedWidgetColor:
                                              ipBoxBorderColor),
                                      child: Checkbox(
                                        value: blockSmanvay,
                                        activeColor: ipBoxTxtColor,
                                        onChanged: (chkValue) {},
                                      ),
                                    ),
                                    Text(
                                      "ब्लॉक समन्वय",
                                      style: ipBoxTxtStyle,
                                    ),
                                  ],
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    anya = (anya) ? false : true;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Theme(
                                      data: ThemeData(
                                          unselectedWidgetColor:
                                              ipBoxBorderColor),
                                      child: Checkbox(
                                        value: anya,
                                        activeColor: ipBoxTxtColor,
                                        onChanged: (chkValue) {},
                                      ),
                                    ),
                                    Text(
                                      "अन्य",
                                      style: ipBoxTxtStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 40,
                  ),
                  child: MaterialButton(
                    child: Text(
                      "Submit",
                      style: buttonTxtStyle,
                      textAlign: TextAlign.center,
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      side: BorderSide(color: buttonBorderColor),
                    ),
                    padding: const EdgeInsets.all(10),
                    onPressed: () async {
                      if (smaudai == false &&
                          jilaSamanvay == false &&
                          blockSmanvay == false &&
                          evolunteer == false &&
                          anya == false) {
                        setState(() {
                          anya = true;
                        });
                        if (_formkey.currentState!.validate()) {
                          await storeUserNameAndNo(
                            userName,
                            mobileNo,
                            villageName,
                            panchayatName,
                            districtName,
                          ).whenComplete(() {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeLoadingEffect(
                                  usrName: userName,
                                  mobileNo: mobileNo,
                                  samudai: smaudai,
                                  eVolunteer: evolunteer,
                                  jilaSamanvay: jilaSamanvay,
                                  blockSamanvay: blockSmanvay,
                                  anya: anya,
                                  villageName: villageName,
                                  panchayatName: panchayatName,
                                  districtName: districtName,
                                ),
                              ),
                            );
                          });
                          return;
                        } else {}
                      } else {
                        if (_formkey.currentState!.validate()) {
                          await storeUserNameAndNo(
                            userName,
                            mobileNo,
                            villageName,
                            panchayatName,
                            districtName,
                          ).whenComplete(() {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeLoadingEffect(
                                  usrName: userName,
                                  mobileNo: mobileNo,
                                  samudai: smaudai,
                                  eVolunteer: evolunteer,
                                  jilaSamanvay: jilaSamanvay,
                                  blockSamanvay: blockSmanvay,
                                  anya: anya,
                                  villageName: villageName,
                                  panchayatName: panchayatName,
                                  districtName: districtName,
                                ),
                              ),
                            );
                          });
                          return;
                        } else {}
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
