import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yaqoob_test_project/Models/profile_model.dart';
import 'package:yaqoob_test_project/api/api_service.dart';
import 'package:yaqoob_test_project/const.dart';

import 'widgets/top_part.dart';
import 'widgets/user_details.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  APIService? apiService;
  @override
  void initState() {
    apiService = APIService();
    Timer.periodic(const Duration(seconds: 3), (timer) {
      apiService!.getUserProfileDetails();
    });
    super.initState();
  }

  @override
  void dispose() {
    // stop streaming when app close
    apiService!.streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("object");
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(logoSmallImagee),
        title: const Text("User Profile"),
      ),
      body: StreamBuilder<ProfileModel>(
        stream: apiService!.streamController.stream,
        builder: (BuildContext context, AsyncSnapshot<ProfileModel> snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Expanded(
                  child: TopPart(profileModel: snapshot.data!),
                ),
                Expanded(
                  flex: 2,
                  child: UserDetails(profileModel: snapshot.data!),
                )
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
