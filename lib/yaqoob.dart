// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:yaqoob_test_project/Models/profile_model.dart';

// import 'shared_service.dart';

// class Yaqoob extends StatefulWidget {
//   const Yaqoob({super.key});

//   @override
//   State<Yaqoob> createState() => _YaqoobState();
// }

// class _YaqoobState extends State<Yaqoob> {
//   final String _baseUrl = "http://54.74.47.46:82";

//   @override
//   void dispose() {
//     // stop streaming when app close
//     _streamController.close();
//     super.dispose();
//   }

//   @override
//   void initState() {
//     super.initState();
//     // A Timer method that run every 3 seconds
//     Timer.periodic(const Duration(seconds: 3), (timer) {
//       getUserProfileDetails();
//     });
//   }

//   // getRandomNumberFact() async* {
//   @override
//   Widget build(BuildContext context) {
//     print("Build");
//     return Scaffold(
//       body: Center(
//         child: StreamBuilder<ProfileModel>(
//           stream: _streamController.stream,
//           builder: (context, snapdata) {
//             switch (snapdata.connectionState) {
//               case ConnectionState.waiting:
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               default:
//                 if (snapdata.hasError) {
//                   return const Text('Please Wait....');
//                 } else {
//                   return Text(snapdata.data!.data!.firstName.toString());
//                 }
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
