import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:overlay_support/overlay_support.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:e_dastak/configuration_files/constants.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

Future getSurveyPageData() async {
  try {
    var deviceIDe = await getDeviceData();
    var appToken = await getToken(deviceIDe);
    await getQuestions(appToken);
  } catch (e) {
    checkConn();
  }
}

Future getHomePageData(
  usrName,
  mobileNo,
  samudai,
  eVolunteer,
  jilaS,
  blockS,
  anya,
  villageName,
  panchayatName,
  districtName,
) async {
  try {
    var deviceIDe = await getDeviceData();
    var appToken = await getToken(deviceIDe);
    await getScheme(
      appToken,
      usrName,
      mobileNo,
      samudai,
      eVolunteer,
      jilaS,
      blockS,
      anya,
      villageName,
      panchayatName,
      districtName,
    );
  } catch (e) {
    checkConn();
  }
}

Future getDeviceData() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  var deviceIDe = androidInfo.androidId;
  return deviceIDe;
}

Future getToken(deviceIDe) async {
  var url =
      Uri.http(uriAuthority, '/api/getToken', {'device_id': '$deviceIDe'});
  var response = await http.post(
    url,
    headers: {
      'accept': 'application/json',
      'content-type': 'application/json',
      'App-Token': staticAppToken,
      'Session-Token': sessionToken,
    },
  );
  if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body);
    return jsonData['app_token'];
  } else {}
}

Future getQuestions(appToken) async {
  var url = Uri.http(uriAuthority, '/api/homeQuestions');
  var response = await http.get(
    url,
    headers: {
      'accept': 'application/json',
      'content-type': 'application/json',
      'App-Token': staticAppToken,
      'Authorization': 'Bearer $appToken',
      'Session-Token': sessionToken,
    },
  );
  if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body);
    List<dynamic> data = jsonData["data"];
    for (var i = 0; i < data.length; i++) {
      String respVar;
      try {
        respVar = data[i]['response']['answer'];
      } catch (e) {
        respVar = "null";
      }
      surveyQueList.add({
        'queid': data[i]['id'],
        'schemeid': data[i]['scheme_id'],
        'question': data[i]['questions'],
        'image': data[i]['image'],
        'response': respVar,
      });
    }
  } else {}
}

Future sendQueRes(qid, resp) async {
  var deviceIDe = await getDeviceData();
  var appToken = await getToken(deviceIDe);
  var url = Uri.http(uriAuthority, '/api/homeQuestions/response',
      {"user_id": "$deviceIDe", "question_id": "$qid", "answer": "$resp"});
  try {
    await http.get(
      url,
      headers: {
        'accept': 'application/json',
        'content-type': 'application/json',
        'App-Token': staticAppToken,
        'Authorization': 'Bearer $appToken',
        'Session-Token': sessionToken,
      },
    );
  } catch (e) {
    checkConn();
  }
}

Future getScheme(
  appToken,
  usrName,
  mobileNo,
  samudai,
  eVolunteer,
  jilaS,
  blockS,
  anya,
  villageName,
  panchayatName,
  districtName,
) async {
  var url = Uri.http(
    uriAuthority,
    '/api/getScheme',
    {
      'user_name': '$usrName',
      'mobile_no': '$mobileNo',
      'samudai': "$samudai",
      'e_volunteer': "$eVolunteer",
      'jila_samanvay': "$jilaS",
      'block_samanvay': "$blockS",
      'others': "$anya",
      'village_name': "$villageName",
      'panchayat_name': "$panchayatName",
      'district_name': "$districtName",
    },
  );

  var response = await http.get(
    url,
    headers: {
      'accept': 'application/json',
      'content-type': 'application/json',
      'App-Token': staticAppToken,
      'Authorization': 'Bearer $appToken',
      'Session-Token': sessionToken,
    },
  );
  yojnaDataList.clear();
  if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body);
    List<dynamic> data = jsonData["data"];
    for (var i = 0; i < data.length; i++) {
      yojnaDataList.add({
        'yojnaid': data[i]['id'],
        'yojna_name': data[i]['scheme_name'],
        'yojna_img': data[i]['image'],
        'applyLink': data[i]['apply_link'],
        'shikayatLink': data[i]['complaints'],
        'helpline': data[i]['helpline'],
        'responses': data[i]['responses'],
        'aim': data[i]['aim'],
        'profit': data[i]['profit'],
        'yojLink': data[i]['description'],
      });
    }
  } else {}
}

Future sendSchemeRes(schemeId, que, resp) async {
  var deviceIDe = await getDeviceData();
  var appToken = await getToken(deviceIDe);
  var url = Uri.http(uriAuthority, '/api/getScheme/response',
      {"scheme_id": "$schemeId", "questions": "$que", "answer": "$resp"});
  await http.post(
    url,
    headers: {
      'accept': 'application/json',
      'content-type': 'application/json',
      'App-Token': staticAppToken,
      'Authorization': 'Bearer $appToken',
      'Session-Token': sessionToken,
    },
  );
}

Future checkConn() async {
  bool result = await InternetConnectionChecker().hasConnection;
  if (result != true) {
    showSimpleNotification(
      const Text("No Internet Connection"),
      background: Colors.red,
    );
    return false;
  } else {
    return true;
  }
}

Future checkConnOnTO() async {
  bool result = await InternetConnectionChecker().hasConnection;
  if (result != true) {
    showSimpleNotification(
      const Text("No Internet Connection"),
      background: Colors.red,
    );
    return false;
  } else {
    return true;
  }
}

// void generateFakeYojdata() {
//   for (var i = 0; i < 10; i++) {
//     yojnaDataList.add({
//       'yojnaid': "$i",
//       'yojna_name': "$i Name skfdhkdf  hchfsodhcou asailhfashd aslsihd",
//       'yojna_img': "https://ladlilaxmi.mp.gov.in/NewTheme/images/logo.png",
//       'yojna_desc': "Descc",
//       'applyLink': "https://ladlilaxmi.mp.gov.in/NewTheme/images/logo.png",
//       'shikayatLink': "https://ladlilaxmi.mp.gov.in/NewTheme/images/logo.png",
//       'helpline': "9098096492",
//       'responses': "yes",
//     });
//   }
// }
// void generateFakeQueData() {
//   for (var i = 0; i < 10; i++) {
//     surveyQueList.add({
//       'queid': "2",
//       'schemeid': "4",
//       'question':
//           "क्या परिवार में माता-पिता में से किसी एक ने परिवार नियोजन अपना लिया है?",
//       'image': "https://ladlilaxmi.mp.gov.in/NewTheme/images/logo.png",
//       'response': "no",
//     });
//   }
// }
