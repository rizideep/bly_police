import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../server_api/server_constant.dart';

import '../server_api/server_url.dart';
import '../utils/getx_storage.dart';
import '../utils/preferences_constant.dart';
import '../utils/util.dart';
import 'app_events.dart';

class AppRepository {
  postApiCall(String apiEndPoint, Map<String, dynamic> queryParameters) async {
    http.Response response;
    var box = GetStorageUtil();
    var isConnected = await MyUtil.checkConnectivityStatus();
    if (isConnected) {
      MyUtil.printWW(" $apiEndPoint {api queryParameters}): $queryParameters");
      var accessToken = box.read(PreferencesConstant.accessToken);
      response = await http
          .post(Uri.parse(ServerUrl.baseUrl + apiEndPoint),
              headers: {
                HttpHeaders.acceptHeader: 'application/json',
                HttpHeaders.contentTypeHeader: 'application/json',
                HttpHeaders.authorizationHeader: 'Bearer $accessToken',
              },
              encoding: Encoding.getByName("utf-8"),
              body: jsonEncode(queryParameters))
          .timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          // Time has run out, do what you wanted to do.
          return Response(
              "",
              ServerConstant
                  .slowNetworkStatus); // Request Timeout response status code
        },
      );
      MyUtil.printV("Bearer $accessToken");
      MyUtil.printW(
          " $apiEndPoint API response: $jsonDecode(${response.body})");
    } else {
      response = Response("", ServerConstant.networkStatus);
    }

    return response;
  }

  postApiCallWithObject(String apiEndPoint, Object queryParameters) async {
    http.Response response;
    var isConnected = await MyUtil.checkConnectivityStatus();
    if (isConnected) {
      var box = GetStorageUtil();
      var accessToken = box.read(PreferencesConstant.accessToken);
      response = await http
          .post(Uri.parse(ServerUrl.baseUrl + apiEndPoint),
              headers: {
                HttpHeaders.acceptHeader: 'application/json',
                HttpHeaders.contentTypeHeader: 'application/json',
                HttpHeaders.authorizationHeader: 'Bearer $accessToken',
              },
              encoding: Encoding.getByName("utf-8"),
              body: jsonEncode(queryParameters))
          .timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          // Time has run out, do what you wanted to do.
          return Response(
              "",
              ServerConstant
                  .slowNetworkStatus); // Request Timeout response status code
        },
      );
      MyUtil.printV("Bearer $accessToken");
      MyUtil.printW(" $apiEndPoint API response: $jsonEncode${response.body})");
    } else {
      response = Response("", ServerConstant.networkStatus);
    }
    return response;
  }

  getApiCall(String apiEndPoint, Map<String, String>? queryParameters) async {
    http.Response response;
    var isConnected = await MyUtil.checkConnectivityStatus();
    if (isConnected) {
      var box = GetStorageUtil();
      MyUtil.printWW(" $apiEndPoint {api queryParameters}: $queryParameters");
      var accessToken = box.read(PreferencesConstant.accessToken);
      response = await http.get(
        Uri.http(ServerUrl.baseUrlGet, apiEndPoint, queryParameters),
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $accessToken',
        },
      ).timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          // Time has run out, do what you wanted to do.
          return Response(
              "",
              ServerConstant
                  .slowNetworkStatus); // Request Timeout response status code
        },
      );
      MyUtil.printV("Bearer $accessToken");
      MyUtil.printW(
          " $apiEndPoint API response: $jsonDecode(${response.body})");
    } else {
      response = Response("", ServerConstant.networkStatus);
    }

    return response;
  }

  /*Future<List<Map<String, dynamic>>> getMultipleApiData() async {
    var value = <Map<String, dynamic>>[];
    var r1 = http.get('https://www.dart.dev');
    var r2 = http.get('https://www.flutter.dev');
    var results = await Future.wait([r1, r2]); // list of Responses
    for (var response in results) {
      print(response.statusCode);
      value.add(json.decode(response.body));
    }
    return value;
  }*/

  //******************************************************************************

  userLoginApi(LoginEvent event) async {
    final queryParameters = {
      'mobile_number': event.mobileNumber,
      'isd_code': event.isSdCode,
      'source': event.source,
    };
    return await postApiCall(ServerUrl.sendOtp, queryParameters);
  }

// userVerifyOtpApi(VerifyOtpEvent event) async {
//   final queryParameters = {
//     'device_type': event.deviceType,
//     'device_id': event.deviceId,
//     'device_token': event.devicesToken,
//     'otp': event.otp
//   };
//   return await postApiCall(ServerUrl.verifyOtp, queryParameters);
// }

// updateProfileSingleApi(UpdateProfileEvent event) async {
//   UpdateProfileRequest editDietRequestModel = event.updateProfileRequest;
//   return await uploadData(editDietRequestModel);
// }

// uploadData(UpdateProfileRequest profile) async {
//   var box = GetStorageUtil();
//   var postUri = Uri.parse('${ServerUrl.baseUrl}upload-file');
//   String? token = box.read(PreferencesConstant.accessToken);
//
//   var headerMap = {
//     "Content-Type": "application/x-www-form-urlencoded",
//     "Authorization": "Bearer $token"
//   };
//   http.MultipartRequest request = http.MultipartRequest("POST", postUri);
//
//   // Adding text fields from UpdateProfileRequest object
//   request.headers.addAll(headerMap);
//   if (profile.name != null) {
//     request.fields['name'] = profile.name!;
//   }
//   if (profile.bio != null) {
//     request.fields['bio'] = profile.bio!;
//   }
//   if (profile.gender != null) {
//     request.fields['gender'] = profile.gender!;
//   }
//   if (profile.address != null) {
//     request.fields['address'] = profile.address!;
//   }
//   if (profile.country != null) {
//     request.fields['country'] = profile.country!;
//   }
//   if (profile.state != null) {
//     request.fields['state'] = profile.state!;
//   }
//   if (profile.city != null) {
//     request.fields['city'] = profile.city!;
//   }
//   if (profile.name != null) {
//     request.fields['name'] = profile.name!;
//   }
//   if (profile.language != null) {
//     request.fields['language'] = profile.language!;
//   }
//
//
//   if (profile.profilePic != null) {
//     // Adding profile picture (File Upload)
//     File profilePic = File(profile.profilePic!);
//     if (await profilePic.exists()) {
//       request.files.add(await http.MultipartFile.fromPath(
//         'profile_pic',
//         profilePic.path,
//         filename: basename(profilePic.path),
//       ));
//     }
//   }
//
//   if (profile.experiences != null && profile.experiences!.isNotEmpty ) {
//     // Adding experiences as a JSON encoded string
//     List<Map<String, dynamic>> experiences = profile.experiences!.map((exp) {
//       return {
//         "title": exp.title,
//         "gym_name": exp.gymName,
//         "exp_year_month": exp.expYearMonth,
//         "description": exp.description,
//       };
//     }).toList();
//     request.fields['experiences'] = jsonEncode(experiences);
//   }
//
//
//   if (profile.certifications != null && profile.certifications!.isNotEmpty ) {
//     // Adding certifications (both fields and file uploads)
//     for (var i = 0; i < profile.certifications!.length; i++) {
//       Certification cert = profile.certifications![i];
//       if (cert.title != null) {
//         request.fields['certifications[$i][title]'] = cert.title!;
//       }
//
//       if (cert.college != null) {
//         request.fields['certifications[$i][college]'] = cert.college!;
//       }
//
//       if (cert.issueDate != null) {
//         request.fields['certifications[$i][issue_date]'] = cert.issueDate! ;
//       }
//
//       if (cert.file != null) {
//         File certFile = File(cert.file!);
//         if (await certFile.exists()) {
//           request.files.add(await http.MultipartFile.fromPath(
//             'certifications[$i][file]',
//             certFile.path,
//             filename: basename(certFile.path),
//           ));
//         }
//       }
//
//     }
//   }
//
//
//
//   // Send the request and get a response
//   var response = await request.send();
//   var responseData = await response.stream.bytesToString();
//   MyUtil.printW("API response: $responseData");
//   if (response.statusCode == 200) {
//     if (kDebugMode) {
//       MyUtil.showToast("Upload successful");
//     }
//   } else {
//     if (kDebugMode) {
//       MyUtil.showToast("Failed to upload data: ${response.statusCode}");
//     }
//   }
//
//   return response;
// }
}
